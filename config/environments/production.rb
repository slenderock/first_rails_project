Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  config.serve_static_files = ENV['RAILS_SERVE_STATIC_FILES'].present?

  # assets configuration
  config.assets.js_compressor = :uglifier
  config.assets.compile = true
  config.assets.digest = true

  config.log_level = :debug
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify

  # configurate action mailer
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

  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false
end
