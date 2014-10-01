MechanizeStore::Engine.routes.draw do

  devise_for :managers, class_name: "MechanizeStore::Manager", module: :devise

  root 'dashboards#show'

  scope module: 'store' do
    resources :products, only: :index
  end

  namespace :admin do
    resource  :dashboard, only: :show
    resources :product_sections
    resources :product_categories
    resources :products do 
      resources :product_photos, only: ['index', 'create', 'new', 'destroy'], shallow: true
      post :enable
    end
    resources :flags
    resources :payment_types
    resources :payment_statuses
    resources :order_statuses
    resources :orders
    resources :product_sections  
  end
  
end
