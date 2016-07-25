# Create 50 user with default avatar
Image.delete_all
User.delete_all
ActiveRecord::Base.connection.execute('TRUNCATE TABLE users RESTART IDENTITY')
ActiveRecord::Base.connection.execute('TRUNCATE TABLE images RESTART IDENTITY')

User.create(
  first_name: 'super_admin',
  last_name: '1',
  email: 'superadmin@ukr.net',
  birthday: '20.10.1995',
  password: 228_228,
  password_confirmation: 228_228,
  role: 'super_admin',
  position: 51
)

User.create(
  first_name: 'admin',
  last_name: '1',
  email: 'admin@ukr.net',
  birthday: '20.10.1995',
  password: 228_228,
  password_confirmation: 228_228,
  role: 'admin',
  position: 50
)

50.times do |index|
  User.create(
    first_name: 'user',
    last_name: index,
    email: "user#{index}@ukr.net",
    birthday: '20.10.1995',
    password: 123_456,
    password_confirmation: 123_456,
    role: 'user',
    position: index
  )
end
