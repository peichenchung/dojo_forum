Rails.application.routes.draw do
  devise_for :users
  root "articles#index"
  resources :articles

  namespace :admin do
    root "articles#index"
  end
end
