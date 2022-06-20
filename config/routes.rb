# frozen_string_literal: true

# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  resources :simulations

  # Defines the root path route ("/")
  root 'simulations#index'
end
