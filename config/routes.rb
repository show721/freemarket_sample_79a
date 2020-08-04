Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: "home#index"

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
  resources :registration, only: [:index]
end
