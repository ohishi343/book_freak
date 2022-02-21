class ApplicationController < ActionController::Base
  before_action :set_q
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile, :avatar])
  end

  def set_q
    @q = Post.ransack(params[:q])
  end
end
