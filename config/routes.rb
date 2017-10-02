# coding: utf-8
Rails.application.routes.draw do

  
  resources :users do
    resources :musics
  end

  resources :home
  
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
