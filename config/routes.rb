Rails.application.routes.draw do
  devise_for :users

  resources :articles
  root "articles#index"


  namespace :admin do
    resources :categories
    resources :users
    root "categories#index"
  end
end
