class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :set_locale

  private

  def set_locale
    if params[:locale].present?
      locale = (I18n.available_locales & [params[:locale].to_sym]).first
      if locale
        I18n.locale = locale
      else
        redirect_to root_path(locale: I18n.default_locale)
      end
    else
      I18n.locale = I18n.default_locale
    end
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
