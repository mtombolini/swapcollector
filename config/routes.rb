Rails.application.routes.draw do
  devise_for :users
   get 'render/index'
 
  # For more details on this file's DSL, see https://guides.rubyonrails.org/routing.html
  root 'render#index'
  resources :producto do
    resources :solicitudes, only: [:index]
    resources :resenas, only: [:index]
  end

  resources :solicitudes

  resources :chat do
    resources :mensajes, only: [:index, :create]
  end

  resources :review

  post '/review/:id', to: 'review#create', as: 'create_review'
  get 'review/:id', to: 'review#show', as: 'show_review'


 end
