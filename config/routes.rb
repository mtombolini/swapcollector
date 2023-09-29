Rails.application.routes.draw do
   get 'layouts/application'
 
  # For more details on this file's DSL, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
 end
