MechanizeStore::Engine.routes.draw do
    resources :product_categories

    resources :products
    resources :flags
    resources :payment_types
    resources :payment_statuses
    resources :order_statuses
    resources :orders  
end
