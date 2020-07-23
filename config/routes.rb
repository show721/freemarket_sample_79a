Rails.application.routes.draw do
  root "toppages#index"
  resources :products, except: :show
end
