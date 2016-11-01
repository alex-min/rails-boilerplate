raise 'Environment variable APPLICATION_NAME is mandatory' unless ENV['APPLICATION_NAME'].present?
Rails.application.config.application_name = ENV['APPLICATION_NAME']
