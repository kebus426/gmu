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
        redirect_to login_url
      end
    end

    def search_id
      puts "search_id"
      puts request.env["remote_user"]
      @user = User.find_by(user_name: request.env["REMOTE_USER"])
      if @user == nil 
        @user = User.new(request.env["REMOTE_USER"])
      else
#        log_in(@user.id)
      end
    end
end
