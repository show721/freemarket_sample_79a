Rails.application.routes.draw do
  root "toppages#index"

  resources :products

end
