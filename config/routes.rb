Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'users/new'
  root 'static_pages#home'
  get '/signup',  to: 'users#new'
  get '/help',    to: 'static_pages#help'
  get '/contact', to: 'static_pages#contact'
end
