# coding: utf-8
class HomeController < ApplicationController
  def index
    @musics = Music.limit(5).includes(:user) if logged_in?
  end

  def about
  end

  def help
  end
  
  def contact
  end
  
  def new
  end

  def show
#    @music = Music.find(params[:id])
#    puts @music
  end
  
  def create
  end

  def destroy
  end


#  private
#  def music_params
#    puts params
#    params.require(:music).permit(:user, :upload_file, :original_filename) 
#  end
 

end
