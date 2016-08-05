Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  config.assets.debug = true
  config.assets.digest = true
  config.assets.raise_runtime_errors = true

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # configurate action mailer
  # config.action_mailer.delivery_method = :letter_opener
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_deliveries = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: 'smtp.gmail.com',
    port: 587,
    domain: ENV['SMTP_DOMAIN'],
    authentication: :plain,
    enable_starttls_auto: true,
    user_name: ENV['SMTP_USERNAME'],
    password: ENV['SMTP_PASSWORD']
  }
  config.action_mailer.default_url_options = {
    host: 'localhost:3000',
    protocol: ENV['SMTP_PROTOCOL']
  }
  config.action_mailer.default_options = { from: 'sergiy20101995@gmail.com' }
end
