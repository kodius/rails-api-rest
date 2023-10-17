# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/spec'
  mount Rswag::Api::Engine => '/spec'
  namespace :api, format: :json do
    post 'sessions/sign-up', to: 'registrations#create'
    post 'sessions/login', to: 'sessions#create'
  end
end
