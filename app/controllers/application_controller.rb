class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :set_locale

  before_filter :basic_auth

  private

  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
  end

  def default_url_option(options = {})
    {locale: I18n.locale}
  end

  def basic_auth
    if Rails.env.production?
      authenticate_or_request_with_http_basic do |id, password|
        id == ENV['ACACIAS_DEMO_USER'] && password == ENV['ACACIAS_DEMO_PASSWORD']
      end
    end
  end

end
