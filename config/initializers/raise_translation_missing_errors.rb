class TestExceptionLocalizationHandler
  def call(exception, locale, key, options)
    raise exception.message
  end
end

Rails.application.config.action_view.raise_on_missing_translations = true

I18n.exception_handler = TestExceptionLocalizationHandler.new
