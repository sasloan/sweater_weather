require 'rails_helper'

RSpec.describe 'Anitpodes', type: 'request' do 
  it 'An antipode coordinates and weather data can be found through this endpoint', :vcr do 

    starting_city = 'Hong Kong'

    get "/api/v1/antipode?location=#{starting_city}"

    clean_response = JSON.parse(response.body, symbolize_names: true)

    expected_response_body = {
      :data => 
        {:attributes=>
          {:current_temperature=>55.26, 
          :location_name=>"Argentina", 
          :search_location=>"Hong Kong", 
          :summary=>"clear sky"}, 
          :id=>nil, 
          :type=>"antipode"
        }}

    expect(response).to be_successful
    expect(clean_response).to eq(expected_response_body)
  end
end