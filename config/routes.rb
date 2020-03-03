Rails.application.routes.draw do
  get "/signup" , to: "users#new"

  resources :relationships
  resources :users
  resources :categories
  root 'static_pages#home'

  get "/login", to: "sessions#new"
  delete "/logout", to: "sessions#destroy"
  resources :sessions, only: [:create]

  namespace :admin do
    resources :categories do
      # 以下のコードでwordsをcategoriesとリンクさせている
      resources :words
    end

    resources :users
  end

  resources :lessons do
    resources :answers
  end
end