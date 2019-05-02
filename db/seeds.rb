require "faker"
require "time"

#Create admin users

User.create(
  email: 'mayra@aa',
  username: 'michi',
  password: 'aaaaaa',
  country: 'Peru',
  city: 'Lima',
  address: 'Jorge Chavez 184',
  role: 'admin'
)
User.create(
  email: 'vale@aa',
  username: 'vale',
  password: 'aaaaaa',
  country: 'Peru',
  city: 'Lima',
  address: 'Jorge Chavez 184',
  role: 'admin'
)
User.create(
  email: 'diego@aa',
  username: 'dieguin',
  password: 'aaaaaa',
  country: 'Peru',
  city: 'Lima',
  address: 'Jorge Chavez 184',
  role: 'admin'
)

# Create regular Users 
15.times do
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

# Create deposit users
20.times do
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

# Create defined deposit user

User.create(
  email: 'diegocuevas579+abc@gmail.com',
  username: 'DiegoCuevas',
  password: '123456',
  country: 'Peru',
  city: 'Lima',
  address: 'Surquillo',
  role: 'deposit'
)

# Creating Sender
con = 1

20.times do
  Sender.create ([{
  store_name: Faker::Company.name,
  email: Faker::Internet.email,
  order_id: con
  }])
  con += 1
end

# Create shipment not delivered
30.times do
  start_day = Faker::Date.forward(30)
  random_days = rand(30) + 1
  Shipment.create ([{
    tracking_id: Faker::Alphanumeric.unique.alphanumeric(10),
    origin_address: Faker::Address.full_address, 
    destination_address: Faker::Address.full_address, 
    weight: Faker::Number.between(1, 10),
    reception_date: start_day,
    # delivered_date: Faker::Date.forward(60)
    estimated_delivery_date: start_day + random_days,
    freight_value: Faker::Number.between(20 ,100),
    recipient_id: User.ids.sample,
    sender_id: Sender.ids.sample
  }])
end

#Delivered random shipments
10.times do
  random_days = rand(30) + 1
  to_be_delivered= Shipment.pluck(:id).sample
  if Shipment.find(to_be_delivered).reception_date.nil?
    shipment = (Shipment.find(to_be_delivered).reception_date + random_days)
    Shipment.find(id_delivered).update(delivered_date: shipment)
  end
end

# Create Shipment Location
5.times do 
  ShipmentLocation.create ([{
    city: Faker::Address.city,
    country: Faker::Address.country,
    reception_date:Faker::Date.forward(20),
    shipment_id: Shipment.ids.sample
  }])

end

# Create a defined Shipment Location
@user = User.create(
  email: 'valevassallo1+annyeong@gmail.com',
  username: 'valevassallo1',
  password: 'aaaaaa',
  country: 'Peru',
  city: 'Lima',
  address: 'San Miguel',
  role: 'regular'
)

@shipment1 = Shipment.create(
  tracking_id: 'asdfgh1234',
  origin_address: 'Los Angeles', 
  destination_address: 'San Miguel', 
  weight: 5,
  reception_date: Faker::Date.forward(60),
  delivered_date: Faker::Date.forward(60),
  estimated_delivery_date: Faker::Date.forward(60),
  freight_value: Faker::Number.between(20 ,100),
  recipient_id: @user.id,
  sender_id: Sender.ids.sample
)
@shiplocation = ShipmentLocation.create(
  city: 'Lima',
  country: 'Peru',
  reception_date:Faker::Date.forward(20),
  shipment_id: @shipment1.id,
)
p "Correctly added"
