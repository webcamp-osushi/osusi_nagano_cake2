Rails.application.routes.draw do
  # devise_for :customers, class_name: "Customers::Customer"
  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
  }
  namespace :admins do
  resources :customers, only: [:index,:show, :edit, :update]
  end

   devise_for :customers
  namespace :customers do
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
