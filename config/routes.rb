Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root "home#index"

  resources :shipments, only: [:show] do
    get "/search" => :search
    post "/search" => :search
  end
  resources :users, only: :show
  resources :senders, only: :show

  namespace :deposit do
    resources :shipments, only: [:show] do
      get "/search" => :search
      post "/search" => :search
      post "/marked" => :stored
    end
  end

  namespace :admin do
    resources :shipments do
      get "/sales" => :sales
    end
    resources :users, only: :create
  end

  namespace :api do
    resources :shipments
    resources :users
    resources :senders
  end
<<<<<<< HEAD
=======

>>>>>>> 422a814acf1d223939c6fa702bb8a30259eecda2
end