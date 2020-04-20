require 'rails_helper'

RSpec.describe 'User creationg endpoint', type: 'request' do 
  it 'a new user can be made by passing in the correct data' do
    
    email = "whatever@example.com"
    password = "password"
    password_confirmation = "password"
    
    post "/api/v1/users?email=#{email}&password=#{password}&password_confirmation=#{password_confirmation}"

    clean_response = JSON.parse(response.body, symbolize_names: true)

      response_body = {
        :data => 
          {:attributes=>
            {:api_key=> clean_response[:data][:attributes][:api_key], 
            :email=> email}, 
          :id=>"1", 
          :type=>"users"
      }}

    expect(response).to be_successful
    expect(clean_response).to eq(response_body)
    expect(response.status).to eq(200)
  end
end