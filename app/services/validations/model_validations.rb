# frozen_string_literal: true

module Validations
  class ModelValidations

    def self.call(model)
      new(model).call
    end

    def call
      ErrorResponse.call(message: model.errors.messages) unless model.valid?
    end

    private

    attr_reader :model

    def initialize(model)
      @model = model
    end

  end
end
