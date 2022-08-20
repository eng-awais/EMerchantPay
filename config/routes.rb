# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users

  resources :merchants, only: %i[index show edit update destroy] do
    resources :transactions , only: %i[index show]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
