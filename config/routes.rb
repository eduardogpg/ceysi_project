Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'welcome', to: 'sessions#welcome'
    
  resources :users, only: [:new, :create]

end
