class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    favorite = Favorite.where(user_id: current_user).pluck(:post_id)
    @posts = Post.where(id: favorite).includes(:user).order(created_at: :desc).paginate(page: params[:page], per_page: 15)
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
