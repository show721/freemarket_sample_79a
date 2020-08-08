Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root "toppages#index"
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  resources :products do   
    collection do
      post 'purchase'
      get 'buy'
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'search'
    end
  end

  resources :cards, only: [:new, :update, :create, :show , :destroy] 
  resources :users, only: [:index, :new, :edit]
  resources :registration, only: [:index]
  resources :comments, only: [:create, :update, :destroy]
end
