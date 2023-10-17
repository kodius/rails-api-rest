# frozen_string_literal: true

module Authorization
  class AuthToken

    AUTH_TOKEN_LIFETIME = 86_400.seconds.freeze

    def self.call(user_id, jwt_token_uuid)
      new(user_id, jwt_token_uuid).call
    end

    def call
      JWT.encode(
        {
          jwt_token_uuid:,
          user_id:,
          exp: AUTH_TOKEN_LIFETIME.from_now.to_i
        },
        jwt_secret
      )
    end

    private

    attr_reader :user_id, :jwt_token_uuid

    def initialize(user_id, jwt_token_uuid)
      @user_id = user_id
      @jwt_token_uuid = jwt_token_uuid
    end

    def jwt_secret
      Rails.application.secret_key_base
    end

  end
end
