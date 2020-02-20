Rails.application.routes.draw do

  get 'answers/new'
  get 'sessions/new'
  get "/signup" , to: "users#new"

  resources :users
  resources :categories
  root 'static_pages#home'

  get "/login", to: "sessions#new"
  post "/login" , to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  namespace :admin do
    resources :categories do
      # 以下のコードでwordsをcategoriesとリンクさせている
      resources :words
    end
  end
end