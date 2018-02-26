# coding: utf-8
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(user_name: params[:session][:name])
    if user 
      log_in user
      #params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user
    else
      redirect_to controller: 'users', action: 'new', user_name: request.env["HTTP_X_KMC_REMOTE_USER"]
      #render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
