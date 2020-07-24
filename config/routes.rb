Rails.application.routes.draw do
  root "toppages#index"
  resources :products ,only: [:index, :show]
  
end
