Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :products
      resources :stocks
      resources :contents
      resources :products_of_carts
      resources :deliverys
      resources :shopping_carts
    end
  end
end
