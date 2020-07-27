Rails.application.routes.draw do
  root "toppages#index"
  resources :products do
    collection do
      get 'buy'
    end
  end 
  resources :users, only: [:index, :new, :edit]
end
