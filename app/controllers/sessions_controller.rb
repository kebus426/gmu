# coding: utf-8
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(user_name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user
    else
      flash.now[:danger] = 'ユーザー名とパスワードが不適切です'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
