# frozen_string_literal: true

module Authorization
  class AuthTokenCheck

    def self.call(auth_token)
      new(auth_token).call
    end

    def call
      user_auth_token_check
    rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
      nil
    end

    private

    attr_reader :auth_token

    def initialize(auth_token)
      @auth_token = auth_token&.split('Bearer ')&.last
    end

    def token_payload
      @token_payload ||= JWT.decode(auth_token, jwt_secret, verify: true, verify_iat: true)[0]
    end

    def user
      @user ||= User.find_by(id: token_payload['user_id'])
    end

    def user_auth_token_check
      return unless user&.jwt_token_uuid_valid?(token_payload['jwt_token_uuid'])

      user
    end

    def jwt_secret
      Rails.application.secret_key_base
    end

  end
end
