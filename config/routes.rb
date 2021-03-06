Rails.application.routes.draw do

  get "password_resets/new"
  get "password_resets/edit"
  get "users/new"
  root "static_pages#home"
  get "sessions/new"
  get "/signup",  to: "users#new"
  get "/help",    to: "static_pages#help"
  get "/contact", to: "static_pages#contact"
  get "/login",     to: "sessions#new"
  post "/login",    to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets
  resources :microposts, only: [:create, :destroy]
end
