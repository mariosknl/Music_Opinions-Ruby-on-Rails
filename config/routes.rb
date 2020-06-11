# frozen_string_literal: true

Rails.application.routes.draw do
  resources :opinions
  resources :sessions, only: %i[new create destroy]
  resources :users
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
