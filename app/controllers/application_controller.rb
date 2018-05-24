# coding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :search_id
  
  private
      # ユーザーのログインを確認する
  def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to "home/index"
      end
    end
  
  def http_remote_user
    request.env['REMOTE_USER'] || request.headers['X-Forwarded-User'] || request.headers['HTTP_X_KMC_REMOTE_USER'] 
  end

  def search_id
    @user = User.find_by(user_name: http_remote_user)
    logger.debug "user:"
    logger.debug request.headers['X-KMC-REMOTE-USER']
    if @user == nil
      logger.debug "user:"
      logger.debug http_remote_user
      @user = User.new(user_name: http_remote_user)
      if @user.valid? && @user.save
        log_in @user
        flash[:success] = "Welcome to God Music Uploader!"
        logger.debug "user"
        redirect_to @user
      else
        logger.debug "error"
        head :forbidden
      end
    else
      logger.debug "niljanaiyo"
      log_in(@user)
    end
  end
end
