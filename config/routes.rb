Rails.application.routes.draw do
  devise_for :users

  resources :articles do
    resources :comments

    member do
      post :collect
      post :uncollect
    end
  end

  resources :users, only: [:show, :edit, :update] do
    member do
      get :my_comment
      get :my_collect
      get :my_draft
      get :my_friend
    end
  end

  resources :friendships, only: [:destroy]

  resources :friend_requests, only: [:create, :update, :destroy] do
    resources :friendships, only: [:create]
    #先送出friend_request->對方同意->friendship才成立

    member do
      delete :ignore
    end
  end

  resources :categories, only: :show
  root "articles#index"


  namespace :admin do
    resources :categories
    resources :users
    root "categories#index"
  end
end
