Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }, 
             path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  # Defines the root path route ("/")
  resources :products do
    resources :comments, only: [:show, :create]
  end
  resources :comments, only: [:show, :update, :destroy]
  
  devise_scope :user do
    root to: 'home#home'
  end

  resources :trade_offers

end
