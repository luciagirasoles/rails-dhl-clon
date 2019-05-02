Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root "home#index"

  resources :users, only: :show
  resources :senders, only: :show

  namespace :regular do
<<<<<<< HEAD
    resource :shipment, only:[:index,:show] do
    get "search", on: :collection
    get "index", on: :collection
    # post "/search" => :search
    end
  end

  namespace :deposit do
    resources :shipment
      get "/index", to: 'shipment#index'
      get "/show/:tracking_id", to: "shipment#show"
      get "/search", to: 'shipment#search'
      post "/check_in", to: 'shipment#check_in'
=======
    resources :shipments, only: :index do
    get "search", on: :collection
    get "show", on: :member
    # post "/search" => :search
    end
>>>>>>> d340b849a345f0ed46c22c8cd6fbc4388364352a
  end
  namespace :admin do
<<<<<<< HEAD
    resources :shipment do
      get "/sales" => :sales
=======
    resources :shipments do
      get "search", on: :collection
      get "sales" => :sales
>>>>>>> d340b849a345f0ed46c22c8cd6fbc4388364352a
    end
    resources :users, only: :create
  end

  namespace :deposit do
    resources :shipment
      get "/index", to: 'shipment#index'
      get "/show/:tracking_id", to: "shipment#show"
      get "/search", to: 'shipment#search'
      post "/check_in", to: 'shipment#check_in'
  end

  namespace :api,  only:[:index, :show, :update] do
    resources :shipment
    get 'show' , to: 'shipment#show'
    get 'index' , to: 'shipment#index'
    get 'search', to: 'shipment#search'
    post 'login', to: 'sessions#create'
  end
  
  resources :error , only: [:index] do
    get "/error" => :error
  end
end