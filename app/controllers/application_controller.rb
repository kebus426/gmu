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

  def search_id
    @user = User.find_by(user_name: request.env["HTTP_X_KMC_REMOTE_USER"])
    if @user == nil
      puts "user:"
      puts request.env["HTTP_X_KMC_REMOTE_USER"]
      @user = User.new(user_name: request.env["HTTP_X_KMC_REMOTE_USER"])
      if @user.valid? &&  @user.save
        log_in @user
        flash[:success] = "Welcome to God Music Uploader!"
        puts "user"
        redirect_to @user
      else
        puts "home"
        head :forbidden
      end
    else
      puts "niljanaiyo"
      log_in(@user)
    end
  end
end
