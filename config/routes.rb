Rails.application.routes.draw do

  root "customers/products#top"
  get "about" => "customers/products#about"
  # devise_for :customers, class_name: "Customers::Customer"


  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
  }
  namespace :admins do
  resources :customers, only: [:index,:show, :edit, :update]
  root 'products#top'
  	resources :products, except: [:destroy]
  	resources :genres, only: [:create, :index, :edit, :update]
  end

  devise_for :customers

  namespace :customers do

    resources :products, only: [:index, :show]
    resources :carts, except: [:show, :new, :edit]
    delete "carts" => "carts#destroy_all"
    resources :addresses, except:[:new, :show]
 
  end

 resources :customers, only: [:show]

  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  #退会機能
  # resources :customers do
  #       member do
  #           get "confirm"
            
  #           patch "leave"
  #   end

