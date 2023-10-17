# frozen_string_literal: true

class ApiController < ActionController::API

  wrap_parameters false
  before_action :authenticate_user!
  before_action :set_locale

  def authenticate_user!
    authenticate_user
    render ErrorResponse.call(status: 401, message: 'The token is invalid. Please log again') if @current_user.blank?
  end

  def current_user
    @current_user || authenticate_user
  end

  def authenticate_user
    auth_token = request.authorization.presence
    @current_user = auth_token && Authorization::AuthTokenCheck.call(auth_token)
  end

  private

  def set_locale
    return set_default_locale unless %w[en hr].include?(content_language)

    I18n.locale = content_language
  rescue I18n::InvalidLocale
    set_default_locale
  end

  def content_language
    request.headers['Content-Language']
  end

  def set_default_locale
    I18n.locale = I18n.default_locale
  end

end
