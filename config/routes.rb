# frozen_string_literal: true

Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :stores, only: [:index]
    resources :orders, only: [:index]
  end
end
