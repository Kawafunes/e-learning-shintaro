Rails.application.routes.draw do
  get 'user/new'
  # Users
  get "/signup" , to: "user#new"
  # Login and Logout
  get "/login", to: "sessions#new"

  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
