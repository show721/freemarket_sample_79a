Rails.application.routes.draw do
  root "toppages#index"
  resources :products ,only: :index
  resources :users, only: [:index, :new, :edit]
end