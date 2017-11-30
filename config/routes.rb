
# coding: utf-8
Rails.application.routes.draw do

  root 'home#index'
  get '/help', to: 'home#help'
  get '/about', to: 'home#about'
  get '/contact', to: 'home#contact'

  get  '/signup',  to: 'users#new'
  resources :users do
    member do
      get 'bookmark', to: 'favorites#show'
    end
  end
  
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :musics, only: [:create, :destroy, :new, :show] do
    member do
      post 'add', to: 'favorites#create'
      delete 'delete', to: 'favorites#destroy'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
