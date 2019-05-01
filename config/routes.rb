Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root "home#index"

  resources :shipments, only: [:show]
  get "/search", to: 'shipments#search'
    # post "/search" => :search
  resources :users, only: :show
  resources :senders, only: :show

  namespace :deposit do
    resources :shipments, only: [:show] do
      get "/search" => :search
      # post "/search" => :search
      post "/marked" => :stored
    end
  end

  namespace :admin do
    resources :shipments do
      get "/sales" => :sales
    end
    resources :users, only: :create
  end

  namespace :api,  only:[:index, :show, :update] do
    resources :shipment
      get 'index' , to: 'shipment#index'
      get 'search', to: 'shipment#search'
  end
  
  resources :error , only: [:index] do
    get "/error" => :error
  end
end