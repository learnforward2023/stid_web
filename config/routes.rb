# frozen_string_literal: true

Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  use_doorkeeper_openid_connect
  use_doorkeeper
  root to: 'top#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  namespace :api do
    resources :users, only: [:user] do
      collection do
        get :owner
      end
    end
  end
end
