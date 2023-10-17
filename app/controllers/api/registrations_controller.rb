# frozen_string_literal: true

module Api
  class RegistrationsController < ApiController

    skip_before_action :authenticate_user!

    def create
      render ::Authorization::Registration.call(**user_params.to_h.symbolize_keys)
    end

    private

    def user_params
      params.permit(:email, :password, :password_confirmation)
    end

  end
end
