class FeedsController < ApplicationController
before_action :set_feed, only: [:edit, :update, :show, :destroy]
 
  def index
    @feeds = Feed.all.order(created_at: :desc)
    @favorites = current_user.favorites
  end
 
  def new
    if params[:back]
      @feed = Feed.new(feed_params)
    else
      @feed = Feed.new
    end
  end
 
  def create
    @feed = Feed.new(feed_params)
    if params[:back]
      render :new
    else
      if @feed.save
        # FeedMailer.feed_mail(@feed).deliver
        redirect_to feeds_path
        flash[:notice] = "フィードが投稿されました"
      else
        render :new
      end
    end
  end
 
  def edit
    unless @feed.user == current_user
      flash[:error] = "権限がありません"
      redirect_to feeds_path
    end
  end
 
  def update
    if @feed.update(feed_params)
      redirect_to feeds_path
      flash[:notice] = "フィードが更新されました"
    else
      render :edit
    end
  end

  def confirm
    @feed = Feed.new(feed_params)
    render :new if @feed.invalid?
  end
 
  def show
    @favorite = current_user.favorites.find_by(feed_id: @feed.id)
    @comment = Comment.new
  end

  def destroy
    @feed.destroy
    redirect_to feeds_path
    flash[:notice] = "フィードが削除されました"
  end
 
  private
 
  def set_feed
    @feed = Feed.find(params[:id])
  end
 
  def feed_params
    params.require(:feed).permit(:content, :image, :image_cache, :user_id)
  end
  
end
