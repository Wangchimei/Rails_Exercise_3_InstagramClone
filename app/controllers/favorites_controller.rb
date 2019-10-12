class FavoritesController < ApplicationController
  # def index
  #   @favotites = current_user.favorite_feeds
  # end

  def create
    favorite = current_user.favorites.create(feed_id: params[:feed_id])
    redirect_to request.referrer
    flash[:notice] = "#{favorite.feed.user.name}さんのフィードをお気に入り登録しました"
  end

  def show
    @user = User.find(params[:id])
    @favorite = current_user.favorites.find_by(id: params[:id])
    unless current_user == @user
      flash[:error] = "権限がありません"
      redirect_to favorite_path(current_user) and return
    end
    render layout: 'user'
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to request.referrer
    flash[:notice] = "#{favorite.feed.user.name}さんのフィードをお気に入り解除しました"
  end
end
