# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :users do
      resources :favorites, only: :index
    end
  end
end
