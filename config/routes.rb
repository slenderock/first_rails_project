# frozen_string_literal: true
require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web, at: '/sidekiq'

  get 'log_out' => 'sessions#destroy', as: 'log_out'
  get 'log_in'  => 'sessions#new', as: 'log_in'
  get 'sign_up' => 'users#new', as: 'sign_up'
  root to: 'sessions#new'
  resource :sessions, except: [:new, :destroy]
  resources :users, except: [:new] do
    collection { post :import }
  end
end
