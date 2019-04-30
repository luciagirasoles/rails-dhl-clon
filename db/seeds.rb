require "faker"


10.times do
  User.create(
    email: Faker::Internet.email,
    username: Faker::Internet.user_name,
    password: 'aaaaaa',
    country: Faker::Address.country,
    city: Faker::Address.city,
    address: Faker::Address.street_address,
    role: 'regular'
  )
end

