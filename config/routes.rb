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
    get "search", on: :collection
  end
  resources :users, only: [:show]
  resources :favorites, only: [:index]
  post 'favorite/:id' => 'favorites#create', as: 'create_favorite'
  delete 'favorite/:id' => 'favorites#destroy', as: 'destroy_favorite'
  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'

  root "homes#toppage"
end
