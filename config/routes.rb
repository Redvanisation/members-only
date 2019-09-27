# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'

  # get '/p',   to: 'posts#new', as: 'p'

  get 'sessions/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :posts, only: %i[new create index]
end
