Rails.application.routes.draw do
  resources :products ,only: :index
  root "toppages#index"
end
