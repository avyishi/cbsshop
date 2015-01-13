Rails.application.routes.draw do
  resources :users

  resources :orders

  resources :line_items

  resources :carts

  get 'shops/index'

  resources :products do
    get :who_bought, on: :member
  end

  root 'shops#index', as: 'shops'
  
end
