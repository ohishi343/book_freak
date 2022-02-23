Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }

  devise_scope :user do
    get "signup", to: "users/registrations#new"
    get "login", to: "users/sessions#new"
    get "logout", to: "users/sessions#destroy"
  end

  get "toppage", to: "homes#toppage"
  resources :homes, only: [:index]
  resources :posts do
    resource :favorites, only: [:create, :destroy]
    get "search", on: :collection
  end
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'

  root "homes#toppage"
end
