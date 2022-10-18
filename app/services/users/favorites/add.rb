# frozen_string_literal: true

module Users
  module Favorites
    class Add

      def self.call(params)
        new(params).call
      end

      def call
        return attributes_validation_errors if attributes_validation_errors

        SuccessResponse.call(response: @params)
      end

      private

      attr_reader :params

      def initialize(params)
        @params = params
      end

      def attributes_validation_errors
        # validate stuff with custom validators if needed
        false
      end

      # def db_validation_errors
        # validate with model definition
        # @db_entry ||= ::Validations::ModelValidations.call(entry)
      # end

    end
  end
end
