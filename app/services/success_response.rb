# frozen_string_literal: true

class SuccessResponse

  def self.call(status: 200, message: nil, response: nil)
    return { status: status, json: response } if response

    { status: status, json: { message: message || I18n.t('http_response_message.success') } }
  end

end
