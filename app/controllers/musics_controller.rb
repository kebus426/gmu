# coding: utf-8
class MusicsController < ApplicationController

  def create
    @music = current_user.musics.build(music_params)
    puts "wan"
    puts music_params
    puts "nay-n"
    if @music.valid? && @music.save
      puts 'hoge' + @music.file.current_path + 'fuga'
      flash[:success] = "曲を投稿しました！"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
  end

  def show
    @music = Music.find(params[:id])
    @is_faved = Music.joins(:user).joins(:favorites).where(favorites: {user_id: current_user.id}).find_by(id: @music.id) != nil
  end
  
  def new    
    if logged_in?
      @music = current_user.musics.build
    else
        flash[:danger] = "Please log in."
        redirect_to login_url
    end
  end

  private

    def music_params
      params.require(:music).permit(:music_name, :file, :caption)
    end
end
