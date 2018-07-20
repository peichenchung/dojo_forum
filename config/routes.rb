Rails.application.routes.draw do
  devise_for :users

  resources :articles do
    resources :comments
  end

  resources :users, only: [:show, :edit, :update]
  resources :categories, only: :show
  root "articles#index"


  namespace :admin do
    resources :categories
    resources :users
    root "categories#index"
  end
end
