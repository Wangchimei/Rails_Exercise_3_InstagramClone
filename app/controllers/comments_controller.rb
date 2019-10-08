class CommentsController < ApplicationController
  before_action  :set_feed, only: [:create, :destroy]

  def create
    @comment = @feed.comments.create(comment_params)
    flash[:notice] = "コメントしました"
    redirect_to feed_path(@feed)
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
