Rails.application.routes.draw do

  root "customers/products#top"
  get "about" => "customers/products#about"

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }



  namespace :admins do
    resources :customers, only: [:index,:show, :edit, :update]
    root 'products#top'
  	resources :products, except: [:destroy]
  	resources :genres, only: [:create, :index, :edit, :update]
    resources :orders, only: [:create, :index, :edit, :update]
    resources :order_details, only: [:update]
  end

 devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
  }

  namespace :customers do
    # orderのルーティング
    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        post 'confirm'
        get 'thanks'
      end
    end
    # orderのルーティング終わり

    resources :products, only: [:index, :show]
    resources :carts, except: [:show, :new, :edit]
    delete "carts" => "carts#destroy_all"
    resources :customers, only: [:show]
    resources :addresses, except:[:new, :show]

  end

  resources :customers do 
     member do
        get "check"
        patch "leave"
      end
  end




end