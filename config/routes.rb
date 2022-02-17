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

  root "homes#index"
  resources :homes, only: [:index]
  resources :posts do
    collection do
      get "search"
    end
  end
  resources :users, only: [:show]
  resources :favorites, only: [:index]
end
