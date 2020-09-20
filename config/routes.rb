Rails.application.routes.draw do
  root "customers/products#top"
  get "about" => "customers/products#about"
  resources :products, only: [:index, :show]
  # devise_for :customers, class_name: "Customers::Customer"
  devise_for :admins
  namespace :admins do

  end

   devise_for :customers
  namespace :customers do
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
