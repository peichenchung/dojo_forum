Rails.application.routes.draw do
  devise_for :users
  root "articles#index"

  namespace :admin do
    root "articles#index"
  end
end
