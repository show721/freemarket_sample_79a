Rails.application.routes.draw do
  root "toppages#index"
  resources :products do
    collection do
      get 'buy'
    end
    
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end 
  resources :users, only: [:index, :new, :edit]
end