# coding: utf-8
class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.valid? && @comment.save
      flash[:success] = "コメントを投稿しました！"
      redirect_to music_url(@comment.music.id)
    else
      flash[:danger] = "コメント投稿に失敗しました"
      redirect_to music_url(@comment.music.id)
    end

  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :music_id)
  end
end
