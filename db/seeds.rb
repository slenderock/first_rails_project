# frozen_string_literal: true
# Create 50 user with default avatar
Image.delete_all
User.delete_all
ActiveRecord::Base.connection.execute('TRUNCATE TABLE users RESTART IDENTITY')
ActiveRecord::Base.connection.execute('TRUNCATE TABLE images RESTART IDENTITY')
50.times do |index|
  User.create(
    first_name: 'user',
    last_name: index,
    email: "user#{index}@ukr.net",
    birthday: '20.10.1995',
    password: 123_456,
    password_confirmation: 123_456
  )
end
