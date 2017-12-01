# coding: utf-8
class FavoritesController < ApplicationController
  def create


    @user_id = current_user.id
    @music_id = Music.find(params[:id]).id
    @music = Favorite.new(music_id: @music_id, user_id: @user_id)


    if Favorite.find_by(music_id: @music_id, user_id: @user_id) == nil && @music.save
        flash[:success] = 'ふぁぼりました'
        redirect_to music_path(@music_id)
      elsif
        flash[:danger] = 'ふぁぼれませんでした'
        redirect_to music_path(@music_id)
      end

  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, music_id: params[:id] )
    if @favorite.destroy
      flash[:success] = 'ふぁぼを解除しました'
      path = Rails.application.routes.recognize_path(request.referer)
      if path[:controller] == 'favorites'
        redirect_to bookmark_user_path(current_user.id)
      else
        redirect_to music_path(params[:id])
      end
    else
      flash[:danger] = 'ふぁぼを解除出来ませんでした'
      if path[:controller] == 'favorites'
        redirect_to bookmark_user_path(current_user.id)
      else
        redirect_to music_path(params[:id])
      end
    end
  end

  def show
    if logged_in?
      @musics = Music.joins(:user).joins(:favorites).where(favorites: {user_id: current_user.id}).select("users.*, musics.*").includes(:user)#Favorite.where(user_id: current_user.id).joins(:fav_music).select("favorites.*, musics.*").all
    else
      redirect_to login_path
    end
  end

  private
end
