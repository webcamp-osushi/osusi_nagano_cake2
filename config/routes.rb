Rails.application.routes.draw do

  # devise_for :customers, class_name: "Customers::Customer"

  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
  }
  namespace :admins do
  
  	resources :products, except: [:destroy]
  	resources :genres, only: [:create, :index, :edit, :update]
  end

  devise_for :customers

  namespace :customers do
 
  end

resources :customers, only: [:index, :show, :edit, :update]
  root 'products#top'

end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  #退会機能
  # resources :customers do
  #       member do
  #           get "confirm"
            
  #           patch "leave"
  #   end

