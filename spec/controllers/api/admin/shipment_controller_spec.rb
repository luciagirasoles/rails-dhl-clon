require 'rails_helper'
require 'faker'

RSpec.describe Api::Admin::ShipmentController, type: :controller do

  before do
    User.delete_all
    Sender.delete_all
    Shipment.delete_all

    Sender.create(
      store_name: Faker::Commerce.department,
      email: Faker::Internet.email,
      order_id: 123
    )
    @user1 = User.create(
      username: Faker::Name.unique.name,
      email: Faker::Internet.email,
      password: "123456",
      authentication_token: Devise.friendly_token[0, 30],
      city: Faker::Address.city,
      country: Faker::Address.country,
      address: Faker::Address.street_address,
      role: "admin",
    )
    @user2 = User.create(
      username: Faker::Name.unique.name,
      email: Faker::Internet.email,
      password: "123456",
      authentication_token: Devise.friendly_token[0, 30],
      city: Faker::Address.city,
      country: Faker::Address.country,
      address: Faker::Address.street_address,
      role: "admin",
    )
    @user3 = User.create(
      username: Faker::Name.unique.name,
      email: Faker::Internet.email,
      password: "123456",
      authentication_token: Devise.friendly_token[0, 30],
      city: Faker::Address.city,
      country: Faker::Address.country,
      address: Faker::Address.street_address,
      role: "regular",
    )
    @shipment1 = Shipment.create(
      tracking_id: Faker::Alphanumeric.alphanumeric(10),
      origin_address: Faker::Address.full_address,
      destination_address: Faker::Address.full_address, 
      weight: Faker::Number.between(1, 10),
      reception_date: Faker::Date.forward(60),
      estimated_delivery_date: Faker::Date.forward(60),
      freight_value: Faker::Number.between(20 ,100),
      recipient_id: @user1.id,
      sender_id: Sender.all.first.id
    )
    @shipment2 = Shipment.create(
      tracking_id: Faker::Alphanumeric.alphanumeric(10),
      origin_address: Faker::Address.full_address,
      destination_address: Faker::Address.full_address, 
      weight: Faker::Number.between(1, 10),
      reception_date: Faker::Date.forward(60),
      estimated_delivery_date: Faker::Date.forward(60),
      freight_value: Faker::Number.between(20 ,100),
      recipient_id: @user2.id,
      sender_id: Sender.all.first.id
    )
  end

  describe 'GET index' do
    it 'returns http status unathorized
      when you do not pass the token in header' do
      get :index
      expect(response).to have_http_status(:unauthorized)
    end

    it 'returns all shipments' do
      request.headers['Authorization'] = "Token token=#{@user1.authentication_token}"
      get :index
      shipments = JSON.parse(response.body)
      expect(shipments.size).to eq(2)
    end


  end

  describe 'GET show' do
    it 'returns http status unathorized
      when you do not pass the token in header' do
      get :show, params: { tracking_id: @shipment1.tracking_id }
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'GET search' do
    it 'returns http status unathorized
      when you do not pass the token in header' do
      get :search, params: { tracking_id: @shipment1.tracking_id }
      expect(response).to have_http_status(:unauthorized)
    end
  end

end
