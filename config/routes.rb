Rails.application.routes.draw do
  resources :line_items

  resources :carts

  get 'shops/index'

  resources :products

  root 'shops#index', as: 'shops'
  
end
