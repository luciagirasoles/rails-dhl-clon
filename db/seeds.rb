require "faker"

con = 1

# Create Users
100.times do
  User.create(
    email: Faker::Internet.email,
    username: Faker::Internet.user_name,
    password: 'aaaaaa',
    authentication_token: Devise.friendly_token[0, 30],
    country: Faker::Address.country,
    city: Faker::Address.city,
    address: Faker::Address.street_address,
    role: 'regular'
  )
end
5.times do
  User.create(
    email: Faker::Internet.email,
    username: Faker::Internet.user_name,
    password: '123456',
    country: Faker::Address.country,
    city: Faker::Address.city,
    address: Faker::Address.street_address,
    role: 'deposit'
  )
end

# Creating Sender

60.times do
  Sender.create ([{
  store_name: Faker::Commerce.department,
  email: Faker::Internet.email,
  order_id: con,
  city: Faker::Address.city,
  country: Faker::Address.country
  }])
  con += 1
end

# Create shipment

350.times do
  Shipment.create ([{
    tracking_id: Faker::Alphanumeric.alphanumeric(10),
    origin_address: Faker::Address.street_address, 
    destination_address: Faker::Address.street_address, 
    weight: Faker::Number.between(1, 10),
    reception_date: Faker::Date.forward(60),
    delivered_date: Faker::Date.forward(60),
    estimated_delivery_date: Faker::Date.forward(60),
    freight_value: Faker::Number.between(30, 200),
    recipient_id: User.all.reduce([]){ |array, val| array << val.id }.sample,
    sender_id: Sender.all.reduce([]){ |array, val| array << val.id }.sample
  }])
end
  # Create Shipment Location

98.times do 
  ShipmentLocation.create ([{
    city: Faker::Address.city,
    country: Faker::Address.country,
    reception_date:Faker::Date.forward(20),
    shipment_id: Shipment.all.reduce([]){ |array, val| array << val.id }.sample,
  }])

end
p "Correctly added"
