Rails.application.routes.draw do
  root "articles#index"

  namespace :admin do
    root "articles#index"
  end
end
