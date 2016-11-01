class LandingController < ApplicationController
  def index
  end

  def without_locale
    redirect_to root_path(locale: default_locale)
  end

  def users_signup_redirect
    redirect_to new_user_registration_path
  end

  private

  def default_locale
    languages = HTTP::Accept::Languages.parse(request.env['HTTP_ACCEPT_LANGUAGE'].to_s)
    available_langs = HTTP::Accept::Languages::Locales.new %w(en fr)
    (available_langs & languages).first || I18n.default_locale
  end
end
