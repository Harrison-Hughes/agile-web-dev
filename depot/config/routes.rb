Rails.application.routes.draw do
  resources :orders
  root 'store#index', as: 'store_index'
  resources :products
  resources :carts
  resources :line_items
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
