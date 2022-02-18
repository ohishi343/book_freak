class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    favorites = Favorite.where(user_id: current_user.id).pluck(:post_id)
    @posts = Post.includes(:user).find(favorites)
  end

  def create
    Favorite.create(user_id: current_user.id, post_id: params[:id])
    redirect_back fallback_location: root_path
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, post_id: params[:id])
    favorite.destroy
    redirect_back fallback_location: root_path
  end
end
