# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do

  mount Sidekiq::Web => '/jobs'
  Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
    [user, password] == [Rails.env, (ENV['sidekiq_web_pass'] || 'hello#admin')]
  end

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
