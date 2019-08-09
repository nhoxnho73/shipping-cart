Rails.application.routes.draw do
  resource :cart, only: [:show]
  resources :products, only: [:index]
  resources :order_items, only: [:create, :update, :destory]

 root to: 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
