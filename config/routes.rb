Rails.application.routes.draw do
  root to: 'restaurants#index'
  resources :restaurants, only: %i[index show new create destroy] do
    resources :reviews, only: :create
  end
  resources :shopping_cart, only: %i[ show ]
  resources :product_carts, only: %i[ update destroy ]
end
