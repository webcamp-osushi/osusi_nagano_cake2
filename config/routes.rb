Rails.application.routes.draw do

  # devise_for :customers, class_name: "Customers::Customer"
  devise_for :admins
  namespace :admins do

  end

  
  devise_for :customers
  namespace :customers do
 
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

