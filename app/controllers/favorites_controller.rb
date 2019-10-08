class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.create(feed_id: params[:feed_id])
    redirect_to feeds_url
    flash[:notice] = "#{favorite.feed.user.name}さんのフィードをお気に入り登録しました"
  end

  def destroy
    # favorite = current_user.favorites.find_by(id: params[id]).destroy
    favorite = Favorite.find(params[:id])
    Favorite.find(params[:id]).destroy
    redirect_to feeds_url
    flash[:notice] = "#{favorite.feed.user.name}さんのフィードをお気に入り解除しました"
  end

end
