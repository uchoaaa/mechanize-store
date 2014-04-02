Store::Engine.routes.draw do
    resources :products
    resources :flags
    resources :payment_types
    resources :payment_statuses
    resources :order_statuses
    resources :orders  
end
