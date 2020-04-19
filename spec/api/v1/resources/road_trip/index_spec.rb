require 'rails_helper'

RSpec.describe 'A valid user can access roadtrip data', type: 'request' do
  before :each do
    @user = create(:user)

    post "/api/v1/sessions?email=#{@user.email}&password=#{@user.password}"
    
    expect(response).to be_successful
  end

  it 'If the user has a valid api key, they can access the data!' do 
    
  origin = "Denver,CO"
  destination = "Pueblo,CO"
  api_key = @user.api_key

  post "/api/v1/road_trip?origin=#{origin}&destination=#{destination}&api_key=#{api_key}"

  clean_response = JSON.parse(response.body, symbolize_names: true)

  expected_response_body = {
    "origin": "Denver,CO",
    "destination": "Pueblo,CO",
    "travel_time": "1 hour 48 mins",
    "arrival_forecast": "288.18, few clouds"
  }

  expect(response).to be_successful
  expect(clean_response).to eq(expected_response_body)
  end
end
