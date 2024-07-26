# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'top#index'

  devise_for :users
  use_doorkeeper_openid_connect
  use_doorkeeper do
    controllers applications: 'doorkeepers/oauth_applications'
  end

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
