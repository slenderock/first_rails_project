require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SvitlaProject
  # App
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    config.active_record.cache_timestamp_format = :nsec
  end
end
