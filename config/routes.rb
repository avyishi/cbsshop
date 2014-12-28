Rails.application.routes.draw do
  resources :carts

  get 'shops/index'

  resources :products

  root 'shops#index', as: 'shops'
  
end
