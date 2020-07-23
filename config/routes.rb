Rails.application.routes.draw do
  resources :products ,only: :index
  resources :users, only: [:index, :new, :edit]
  root "toppages#index"
end
