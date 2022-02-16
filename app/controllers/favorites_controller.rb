class FavoritesController < ApplicationController
  before_action :move_to_home

  def index
  end

  private

  def move_to_home
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
