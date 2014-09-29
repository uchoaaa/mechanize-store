MechanizeStore::Engine.routes.draw do

  root 'dashboards#show'
  
  namespace :admin do
    resource  :dashboard, only: :show
    resources :product_sections
    resources :product_categories
    resources :products do 
      resources :product_photos, shallow: true
    end
    resources :flags
    resources :payment_types
    resources :payment_statuses
    resources :order_statuses
    resources :orders  
  end
  
end
