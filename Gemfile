# frozen_string_literal: true
source 'https://rubygems.org'
ruby '2.3.1'

gem 'rails', '3.2.22.2'
gem 'pg'
gem 'jquery-rails'
gem 'bcrypt-ruby', require: 'bcrypt'
gem 'thin'
gem 'slim'
gem 'rmagick'
gem 'carrierwave'
gem 'will_paginate-bootstrap', '~> 1.0', '>= 1.0.1'
gem 'cancancan', '~> 1.9'

group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'bootstrap-sass', '3.1.1.0'
  gem 'sass-rails', '~> 3.2.3'
end

group :development do
  gem 'test-unit', '~> 3.0'
  gem 'rubocop', require: false
end

group :test, :development do
  gem 'rspec-rails', '~> 3.0.0'
  gem 'pry'
end

group :test do
  gem 'factory_girl_rails', '~> 4.0'
  gem 'faker', '~> 1.6', '>= 1.6.5'
end

group :production do
  gem 'rails_12factor'
end
