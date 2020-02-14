Rails.application.routes.draw do

  get 'sessions/new'
  get "/signup" , to: "users#new"

  resources :users
  root 'static_pages#home'

  get "/login", to: "sessions#new"
  post "/login" , to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  namespace :admin do
  resources :categories
  end

end