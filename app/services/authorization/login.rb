# frozen_string_literal: true

module Authorization
  class Login

    def self.call(user, password = nil)
      new(user, password).call
    end

    def call
      return user_authentication_error unless authenticate_user

      update_valid_jwt_token_uuid

      SuccessResponse.call(response:)
    end

    private

    attr_reader :user, :password

    def initialize(user, password)
      @user = user
      @password = password
    end

    def authenticate_user
      return false unless user

      user.authenticate(password)
    end

    def user_authentication_error
      ErrorResponse.call(status: 401, message: I18n.t('authentication.auth_invalid'))
    end

    def user_suspended_error
      ErrorResponse.call(status: 401, message: I18n.t('authentication.user_suspended'))
    end

    def update_valid_jwt_token_uuid
      user.update_attribute :valid_jwt_token, jwt_token_uuid
    end

    def jwt_token_uuid
      @jwt_token_uuid ||= SecureRandom.uuid
    end

    def response
      UserSerializer.render_as_hash(user).merge(jwt_token)
    end

    def jwt_token
      { auth_token: AuthToken.call(user.id, jwt_token_uuid) }
    end

  end
end
