require "faker"

# Create Users
  con = 1
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
# Create Shipment Location

5.times do 
  ShipmentLocation.create ([{
    city: Faker::Address.city,
    country: Faker::Address.country,
    reception_date:Faker::Date.forward(20),
    shipment_id: Shipment.all.reduce([]){ |array, val| array << val.id }.sample,
  }])

end
p "Correctly added"