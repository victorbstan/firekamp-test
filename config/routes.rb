# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  namespace :api do
    namespace :v1 do
      post '/register', controller: 'users', action: 'register'
      post '/login', controller: 'users', action: 'login'
      get '/auto_login', controller: 'users', action: 'auto_login'

      resources :artworks, only: %i[index show]
      get '/artworks/search/:search_term', controller: 'artworks', action: 'search'
      post '/artworks/favorite', controller: 'artworks', action: 'favorites'
    end
  end
end
