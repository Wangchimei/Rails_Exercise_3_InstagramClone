class CommentsController < ApplicationController
  before_action  :set_feed, only: [:new, :create, :destroy]

  def new
    @comment = @feed.comments.new(comment_params)
  end

  def create
    @comment = @feed.comments.new(comment_params)
    if @comment.save
      redirect_to feed_path(@feed)
      flash[:notice] = "コメントしました"
    else
      redirect_to feed_path(@feed)
      flash[:notice] = "コメントを入力してください"
    end
  end

  def destroy
    @comment = @feed.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = "コメントを削除しました"
    redirect_to feed_path(@feed)
  end

  private

  def set_feed
    @feed = Feed.find(params[:feed_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :feed_id, :user_id)
  end
end
