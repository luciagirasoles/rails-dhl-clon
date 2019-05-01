Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }	  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
 root "home#index"	  root "home#index"


  resources :shipments, only: [:show] do	  resources :shipments, only: [:show] do
   get "/search" => :search	    get "/search" => :search
   # post "/search" => :search	    # post "/search" => :search
 end	  end
 resources :users, only: :show	  resources :users, only: :show
 resources :senders, only: :show	  resources :senders, only: :show
 namespace :deposit do	  namespace :deposit do
   resources :shipments, only: [:show] do	    resources :shipments, only: [:show] do
     get "/search" => :search	      get "/search" => :search
     # post "/search" => :search	      # post "/search" => :search
     post "/marked" => :stored	      post "/marked" => :stored
   end	    end
 end	  end
 namespace :admin do	  namespace :admin do
   resources :shipments do	    resources :shipments do
     get "/sales" => :sales	      get "/sales" => :sales
   end	    end
   resources :users, only: :create	    resources :users, only: :create
 end	  end
 namespace :api,  only:[:index, :show, :update] do	  namespace :api,  only:[:index, :show, :update] do
   resources 'shipment'	    resources 'shipment'
     get 'index' , to: 'shipment#index'	      get 'index' , to: 'shipment#index'
     get 'search', to: 'shipment#search'	      get 'search', to: 'shipment#search'
 end	  end
     
 resources :error , only: [:index] do	  resources :error , only: [:index] do
   get "/error" => :error	    get "/error" => :error
 end	  end

end	end