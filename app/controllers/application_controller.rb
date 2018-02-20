# coding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :search_id
  
  private
      # ユーザーのログインを確認する
  def logged_in_user
      puts "remote user"
      puts request.env["REMOTE_USER"]
      puts "http"
      puts request.env["HTTP_X_KMC_REMOTE_USER"]
      puts request.headers[:REMOTE_USER]
      
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def search_id
      @user = User.find_by(user_name: request.env["HTTP_X_KMC_REMOTE_USER"])
      if @user == nil
        puts "nildayo"
        @user = User.new(request.env["REMOTE_USER"])
        if @user == nil
          puts "user didn't create"
        end
      else
        puts "niljanaiyo"
        log_in(@user)
      end
    end
end
