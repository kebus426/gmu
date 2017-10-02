class UsersController < ApplicationController
  def index
    puts params[:user]
    @user = User.all
  end

  def new
  end

  def show
    @user = User.find(params[:id])
  end
  
  def create
    user = {}
    puts params[:user][:user_name]
    @user = User.new(:user_name => params[:user][:user_name])
    puts @user
    if @user.save
      redirect_to @user
    end
  end

    def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

end
