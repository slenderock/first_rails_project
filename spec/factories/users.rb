# frozen_string_literal: true
require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.first_name { Faker::Name.first_name }
    f.last_name { Faker::Name.first_name }
    f.birthday  { Faker::Date.between(100.year.ago, 17.year.ago) }
    f.email { Faker::Internet.email }
    f.password 123_123
    f.password_confirmation 123_123
  end
end
