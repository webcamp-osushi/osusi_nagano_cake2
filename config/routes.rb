Rails.application.routes.draw do
  root "customers/products#top"
  get "about" => "customers/products#about"
  resources :products, only: [:index, :show]
  # devise_for :customers, class_name: "Customers::Customer"
  devise_for :admins
  namespace :admins do
    root 'products#top'
    resources :products, except: [:destroy]
    resources :genres, only: [:create, :index, :edit, :update]

  end

   devise_for :customers
  namespace :customers do
    resources :products, only: [:index, :show]
    resources :cart_products, except: [:show, :new, :edit]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
