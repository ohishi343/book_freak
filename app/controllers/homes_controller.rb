class HomesController < ApplicationController
  def index
    @posts = Post.includes(:user, :favorites).order(created_at: :desc).
      paginate(page: params[:page], per_page: 12)
  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
