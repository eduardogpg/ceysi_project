Rails.application.routes.draw do

  get 'shoppingcarts/create'
  get 'shoppingcarts/show', as: 'shopping_cart'
  post 'shoppingcarts/add'
  post 'shoppingcarts/destroy', as: 'shopping_cart_destroy'
  post 'shoppingcarts/complete', as: 'shopping_cart_complete'
  
  resources :shoppingcarts do
    get :completed, on: :member
  end

  resources :products
  get '', to: 'main#home'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'welcome', to: 'sessions#welcome'
    
  resources :users, only: [:new, :create]
  
end
