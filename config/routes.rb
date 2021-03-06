# frozen_string_literal: true

Rails.application.routes.draw do
  resources :opinions do
    resources :comments, only: %i[create]
  end
  resources :sessions, only: %i[new create destroy]
  resources :followings, only: %i[new create destroy]
  resources :users
  root 'sessions#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end