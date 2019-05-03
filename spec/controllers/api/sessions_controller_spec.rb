require 'rails_helper'
require 'faker'

describe Api::SessionsController do
  before do
    User.delete_all
    @user = User.create(
      username: Faker::Name.unique.name,       
      email: Faker::Internet.email,          
      password: "123456",
      authentication_token: Devise.friendly_token[0, 30],
      city: Faker::Address.city,        
      country: Faker::Address.country,
      address: Faker::Address.street_address,  
      role: "regular"       
    )
  end

  describe 'Get login' do

    it 'return http status ok when you pass email and password right' do
      get :create, params: { email: @user.email, password: "123456" }
      expect(response).to have_http_status(:ok)
    end

    it 'render json with a token value' do
      get :create, params: { email: @user.email, password: "123456" }
      expected_token = JSON.parse(response.body)
      expect(expected_token["token"]).to eq(@user.authentication_token)
    end
  end
end