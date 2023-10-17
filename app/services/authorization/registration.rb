# frozen_string_literal: true

module Authorization
  class Registration < ::Validations::Base

    def self.call(params)
      new(params).call
    end

    def call
      if can_be_saved?
        user.password = password
        user.save
        Authorization::Login.call(user, user.password)
        SuccessResponse.call
      else
        error_response
      end
    end

    private

    attr_reader :email, :password, :password_confirmation

    def initialize(params)
      @email = params[:email]
      @password = params[:password]
      @password_confirmation = params[:password_confirmation]
    end

    def custom_errors
      {}.tap do |errors|
        if passwords_mismatch?
          errors[:password_confirmation] =
            'Oops! The passwords you entered don\'t match. Please try again.'
        end
        errors[:email] = 'Please enter valid e-mail addresss' unless valid_email_address?
      end
    end

    def user
      @user ||= User.new(attributes)
    end

    def entity
      user
    end

    def attributes
      { email: }
    end

  end
end
