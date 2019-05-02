require "faker"

con = 1

# Create Users
5.times do
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

@val = User.create(
  email: 'valevassallo1+annyeong@gmail.com',
  username: 'valevassallo1',
  password: 'aaaaaa',
  country: 'Peru',
  city: 'Lima',
  address: 'San Miguel',
  role: 'regular'
)

# Creating Sender

5.times do
  Sender.create ([{
  store_name: Faker::Commerce.department,
  email: Faker::Internet.email,
  order_id: con
  }])
  con += 1
end

# Create shipment

5.times do
  Shipment.create ([{
    tracking_id: Faker::Alphanumeric.alphanumeric(10),
    origin_address: Faker::Address.full_address, 
    destination_address: Faker::Address.full_address, 
    weight: Faker::Number.between(1, 10),
    reception_date: Faker::Date.forward(60),
    delivered_date: Faker::Date.forward(60),
    estimated_delivery_date: Faker::Date.forward(60),
    freight_value: Faker::Number.between(20 ,100),
    recipient_id: User.all.reduce([]){ |array, val| array << val.id }.sample,
    sender_id: Sender.all.reduce([]){ |array, val| array << val.id }.sample
  }])
end

@shipment1 = Shipment.create(
  tracking_id: 'asdfgh1234',
  origin_address: 'Los Angeles', 
  destination_address: 'San Miguel', 
  weight: 5,
  reception_date: Faker::Date.forward(60),
  delivered_date: Faker::Date.forward(60),
  estimated_delivery_date: Faker::Date.forward(60),
  freight_value: Faker::Number.between(20 ,100),
  recipient_id: @val.id,
  sender_id: Sender.all.reduce([]){ |array, val| array << val.id }.sample
)
  # Create Shipment Location

5.times do 
  ShipmentLocation.create ([{
    city: Faker::Address.city,
    country: Faker::Address.country,
    reception_date:Faker::Date.forward(20),
    shipment_id: Shipment.all.reduce([]){ |array, val| array << val.id }.sample,
  }])

end

@diego = User.create(
  email: 'diegocuevas579+abc@gmail.com',
  username: 'DiegoCuevas',
  password: '123456',
  country: 'Peru',
  city: 'Lima',
  address: 'Surquillo',
  role: 'deposit'
)
p "Correctly added"

@shiplocation = ShipmentLocation.create(
  city: 'Lima',
  country: 'Peru',
  reception_date:Faker::Date.forward(20),
  shipment_id: @shipment1.id,
)
p "Correctly added"
