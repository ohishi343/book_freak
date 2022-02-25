class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id).order(created_at: :desc).
      paginate(page: params[:page], per_page: 12)
    @favorites = Post.where(id: @user.favorite_posts).includes(:user).
      order(created_at: :desc).paginate(page: params[:page], per_page: 12)
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.following
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
  end
end
