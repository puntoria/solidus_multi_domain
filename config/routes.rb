# frozen_string_literal: true

Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :stores, only: %i[create]
    resources :orders, only: %i[index]
  end
end
