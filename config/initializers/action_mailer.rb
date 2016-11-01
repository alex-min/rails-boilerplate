raise 'Env variable WEBSITE_HOSTNAME is mandatory' unless ENV['WEBSITE_HOSTNAME'].present?
Rails.application.config.action_mailer.default_url_options = {
  host: ENV['WEBSITE_HOSTNAME'],
  locale: I18n.locale
}
module DeviseMailerDefaultUrl
  def default_url_options(_options={})
    { host: ENV['WEBSITE_HOSTNAME'], locale: I18n.locale }
  end
end
Devise::Mailer.include(DeviseMailerDefaultUrl)
