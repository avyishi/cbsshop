Rails.application.routes.draw do
  get 'shops/index'

  resources :products

  root 'shops#index', as: 'shops'
  
end
