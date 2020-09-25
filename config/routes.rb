Rails.application.routes.draw do

  root "customers/products#top"
  get "about" => "customers/products#about"
  # devise_for :customers, class_name: "Customers::Customer"

  devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
    post 'admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
    delete 'admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'    
  end

  namespace :admins do

  	resources :products, except: [:destroy]
  	resources :genres, only: [:create, :index, :edit, :update]
    resources :orders, only: [:create, :index, :edit, :update]
    resources :order_details, only: [:update]
  end


  end
    
  resources :customers do 
     member do
        get "check"

