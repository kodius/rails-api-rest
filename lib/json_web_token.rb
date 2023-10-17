require 'jwt'

class JsonWebToken

  # Refresh token is valid for 1 week
  INVITATION_TOKEN_LIFETIME = (24 * 60 * 60 * 7).seconds.freeze

  class << self

    def encode(user_id)
      JWT.encode(
        {
          refresh_token: true,
          user_id:,
          exp: INVITATION_TOKEN_LIFETIME.from_now.to_i
        },
        jwt_secret
      )
    end

    def decode(token)
      JWT.decode(token, jwt_secret, verify: true, verify_iat: true)
    rescue JWT::ExpiredSignature, DecodeError => e
      ErrorResponse.call(message: e.message)
    end

    private

    def jwt_secret
      Rails.application.secret_key_base
    end

  end

end
