class HomesController < ApplicationController
  def index
    @posts = Post.includes(:user, :favorites).order(created_at: :desc)
  end
end
