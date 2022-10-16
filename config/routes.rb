# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api, format: :json do
    namespace :users do
      resources :favorites, only: %w[create index]
    end
  end
end
