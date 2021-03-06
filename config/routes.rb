Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }
  
  devise_scope :user do
    get 'users/final_form', to: 'users/registrations#final_form'
    patch 'update_date', to: 'users/registrations#update_data'
  end

  root "home#index"

  resources :users, only: :show
  resources :senders, only: :show

  namespace :regular do
    resources :shipments, only: :index do
    get "search", on: :collection
    get "show", on: :member
    end
  end
  namespace :deposit, only: [:index ] do
    resources :shipment
      get "/index", to: 'shipment#index'
      get "/show/:tracking_id", to: "shipment#show"
      get "/search", to: 'shipment#search'
      post "/check_in", to: 'shipment#check_in'
  end
  

  namespace :admin do
    resources :shipments do
      collection do
        get "search"
        get "sales" => :sales
        get "top-senders-by-packages-sent" => :top_senders_by_packages_sent
        get "top-senders-by-freight-value" => :top_senders_by_freight_value
        get "top-5-countries-recipients" => :top_5_countries_recipients
        get "top-5-countries-senders" => :top_5_countries_senders
        get "search_shipment"
      end
      get "search_and_edit" => :search_and_edit, on: :collection
      patch "update", to: "shipments#update"
    end
    
    resources :users, only: [:new, :create, :edit, :update] do
      collection do
        get "search"
        get "edit_search" => :edit_search
        post "/search_user", to: "users#search_user"
      end
    end
  end

  namespace :deposit do
    resources :shipment
      get "/index", to: 'shipment#index'
      get "/show/:tracking_id", to: "shipment#show"
      get "/search", to: 'shipment#search'
      post "/check_in", to: 'shipment#check_in'
  end

  namespace :api,  only:[:index, :show, :update] do
    post 'login', to: 'sessions#create'
    get 'search', to: 'shipment#search'

    namespace :deposit do
      resources :shipment do
        get 'search', to: 'shipment#search', on: :collection
        post "/check_in", to: 'shipment#check_in'
      end
    end

    namespace :admin do
      resources :shipment do
        get 'index' , to: 'shipment#index'
        get "/show/:tracking_id", to: "shipment#show", on: :collection
        get 'search', to: 'shipment#search', on: :collection
        
    
        collection do
          get "top-senders-by-packages-sent" => :top_senders_by_packages_sent
          get "top-senders-by-freight-value" => :top_senders_by_freight_value
          get "top-5-countries-recipients" => :top_5_countries_recipients
          get "top-5-countries-senders" => :top_5_countries_senders
        end
      end
      resources :users, only: [:new, :create, :edit, :update] do
        collection do
          get "search", to: 'users#search'          
        end
      end
    end        
  end
  
  resources :error , only: [:index] do
    get "/error" => :error
  end
end