Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root "home#index"

  resources :users, only: :show
  resources :senders, only: :show

  namespace :regular do
    resources :shipments, only: :index do
    get "search", on: :collection
    get "show", on: :member
    end
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
      end
      get "search_and_edit" => :search_and_edit, on: :collection
      patch "update", to: "shipments#update"
    end
    
    resources :users, only: [:new, :create, :edit, :update] do
      collection do
        get "search"
        put 
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
    resources :shipment
      get '/search', to: 'shipment#search'
      post 'login', to: 'sessions#create'
    
    namespace :admin do
      resources :shipment do
        get 'index' , to: 'shipment#index'
        get "/show/:tracking_id", to: "shipment#show"
        get '/search', to: 'shipment#search'
      
        collection do
          get "top-senders-by-packages-sent" => :top_senders_by_packages_sent
          get "top-senders-by-freight-value" => :top_senders_by_freight_value
          get "top-5-countries-recipients" => :top_5_countries_recipients
          get "top-5-countries-senders" => :top_5_countries_senders
        end
      end
      resources :users, only: [:new, :create, :edit, :update] do
        collection do
          get '/search', to: 'users#search'
          get "edit_search" => :edit_search
        end
      end

    end    

    namespace :deposit do
      get 'search', to: 'shipment#search'
      post "/check_in", to: 'shipment#check_in'
    end
  end
  
  resources :error , only: [:index] do
    get "/error" => :error
  end
end