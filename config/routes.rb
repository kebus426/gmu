# coding: utf-8
Rails.application.routes.draw do

  root 'home#index'
  get '/help', to: 'home#help'
  get '/about', to: 'home#about'
  get '/login', to: 'home#login'
  get '/contact', to: 'home#contact'

  get  '/signup',  to: 'users#new'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
