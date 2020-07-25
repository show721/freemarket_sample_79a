Rails.application.routes.draw do
  root "toppages#index"
  resources :products
  resources :users, only: [:index, :new, :edit]
end
