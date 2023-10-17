# frozen_string_literal: true

module Api
  class SessionsController < ApiController

    skip_before_action :authenticate_user!
    before_action :set_user, only: :create

    def create
      render ::Authorization::Login.call(@user, params[:password])
    end

    private

    def user_params
      params.permit(:email, :password)
    end

    def set_user
      @user = User.find_by(email: params[:email])
    end

  end
end
