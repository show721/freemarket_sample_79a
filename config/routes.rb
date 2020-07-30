Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  root "toppages#index"

  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  # root "toppages#index"
  resources :products do
    collection do
      get 'buy'
    end
  end 
  resources :users, only: [:index, :new, :edit]
  resources :products, only: [:new, :show, :destroy]
end
