Rails.application.routes.draw do

  resources :users
  get "users/new"
  root "static_pages#home"
  get "/signup",  to: "users#new"
  get "/help",    to: "static_pages#help"
  get "/contact", to: "static_pages#contact"
  get "/login",     to: "sessions#new"
  post "/login",    to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

end
