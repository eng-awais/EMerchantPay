# frozen_string_literal: true

Rails.application.routes.draw do

  resources :merchants, only: %i[index show edit update destroy] do
    resources :transactions, only: %i[index]
  end

  namespace :api do
    namespace :v1 do
      post 'auth_user', to: 'authentication#authenticate_user'
      resources :transactions, only: %i[create]
      namespace :bulk do
        resources :transactions, only: %i[create]
      end
    end
  end

  devise_for :users
  root 'merchants#index'
end
