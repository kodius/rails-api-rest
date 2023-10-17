module Validations
  class Base

    private

    def validation_error_messages
      return {} unless entity

      entity.errors.messages.transform_values(&:uniq)
    end

    def can_be_saved?
      return false unless entity

      entity.errors.empty? && entity.valid? && custom_errors.empty?
    end

    def error_response
      merged_errrors = merge_errors(custom_errors, validation_error_messages)
      ErrorResponse.call(message: merged_errrors)
    end

    def merge_errors(custom_messages, validation_errors)
      custom_messages.merge(validation_errors) do |_key, custom_message_value, validation_error_value|
        (custom_message_value + validation_error_value).uniq
      end
    end

    def passwords_mismatch?
      password != password_confirmation
    end

    def valid_email_address?
      return false if email.empty?

      email =~ URI::MailTo::EMAIL_REGEXP
    end

    def custom_errors
      {}
    end

  end
end
