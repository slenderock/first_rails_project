
ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

# ActiveSupport::TestCase
class ActiveSupport
  # class TestCase is responsible for testing
  class TestCase
  end

  fixtures :all
end
