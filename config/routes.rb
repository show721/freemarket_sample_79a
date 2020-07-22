Rails.application.routes.draw do
  get 'products/index'
  root "toppages#index"
end
