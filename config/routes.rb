Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  root "toppages#index"
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  resources :cards, only: [:new, :update, :create] 

  resources :products do   

    collection do
      get 'purchase'
      get 'buy'
    end

    
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end

  end 
  resources :users, only: [:index, :new, :edit] do
  end
end