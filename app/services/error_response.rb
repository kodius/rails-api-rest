# frozen_string_literal: true

class ErrorResponse

  def self.call(status: 422, message: nil, error_code: nil, value: nil)
    { status:, json: { error: message, error_code:, value: } }
  end

end
