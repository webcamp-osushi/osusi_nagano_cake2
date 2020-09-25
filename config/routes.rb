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
    resources :customers, only: [:index,:show, :edit, :update]
    root 'products#top'
  	resources :products, except: [:destroy]
  	resources :genres, only: [:create, :index, :edit, :update]
    resources :orders, only: [:create, :index, :edit, :update]
    resources :order_details, only: [:update]
  end

<<<<<<< HEAD
  devise_for :customers, controllers: {
=======
 devise_for :customers, controllers: {
>>>>>>> f669856bd484038db90f157e7a664e43466def02
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
  }

  namespace :customers do
<<<<<<< HEAD

    resources :products, only: [:index, :show]
    resources :carts, except: [:show, :new, :edit]
    delete "carts" => "carts#destroy_all"
=======
    # orderのルーティング
>>>>>>> f669856bd484038db90f157e7a664e43466def02
    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        post 'confirm'
        get 'thanks'
      end
    end
<<<<<<< HEAD
=======
    # orderのルーティング終わり

    resources :products, only: [:index, :show]
    resources :carts, except: [:show, :new, :edit]
    delete "carts" => "carts#destroy_all"
    resources :customers, only: [:show]
    resources :addresses, except:[:new, :show]
>>>>>>> f669856bd484038db90f157e7a664e43466def02

 
  end

<<<<<<< HEAD
    
=======
>>>>>>> f669856bd484038db90f157e7a664e43466def02
  resources :customers do 
     member do
        get "check"
        patch "leave"
      end
  end
<<<<<<< HEAD

end
=======




end
>>>>>>> f669856bd484038db90f157e7a664e43466def02
