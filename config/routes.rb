Rails.application.routes.draw do
  root "toppages#index"
  resources :products ,only: [:index, :show]
  resources :users, only: [:index, :new, :edit]
end
