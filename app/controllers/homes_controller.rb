class HomesController < ApplicationController
  def index
    @posts = Post.includes(:user, :favorites).order(created_at: :desc).paginate(page: params[:page], per_page: 15)
  end
end
