# coding: utf-8
class MusicsController < ApplicationController

  def create
    @music = current_user.musics.build(music_params)
    if @music.valid? && @music.save
      flash[:success] = "曲を投稿しました！"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    @music = Music.find(params[:id])
    @user = @music.user
    if(current_user.user_name == @user.user_name)
      @music.destroy
      flash[:success] = "曲を削除しました"
      redirect_to user_path(@user)
    else
      flash[:danger] = "曲を削除できませんでした"
      redirect_to user_path(@user)
    end
  end

  def show
    @music = Music.find(params[:id])
    @is_faved = Music.joins(:user).joins(:favorites).where(favorites: {user_id: current_user.id}).find_by(id: @music.id) != nil
    @comments = @music.comments.includes(:user)
    @comment = @music.comments.build(user_id: current_user.id) if current_user
  end
  
  def new    
    if logged_in?
      @music = current_user.musics.build
    else
        flash[:danger] = "Please log in."
        redirect_to login_url
    end
  end

  def index
    @musics = Music.paginate(page: params[:page]).includes(:user)
  end

  def search
    @musics = Music.where("music_name LIKE ?", "%#{params[:music_name]}%").includes(:user) #if params[:music_name] != nil
    #@musics = @musics.where(users: {"user_name LIKE ?", "%#{params[:user_name]}%"}).includes(:user) if params[:usre_name] != nil
    @search_music = params[:music_name]
    @search_user = params[:user_name]
    render 'index'
  end

  private

    def music_params
      params.require(:music).permit(:file, :music_name, :caption,:artwork)
    end
end
