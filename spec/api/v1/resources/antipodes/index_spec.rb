require 'rails_helper'

RSpec.describe 'Anitpodes', type: 'request' do 
  before :each do 
    @user = create(:user)
  end

  it 'An antipode coordinates and weather data can be found through this endpoint' do 

    starting_city = 'Hong Kong'

    get "/api/v1/antipode?location=#{starting_city}"

    clean_response = JSON.parse(response.body, symbolize_names: true)

    expected_response_body = {
      data: {
          id: "null",
          type: "antipode",
          attributes: {
              location_name: "Antipode City Name",
              forecast: {
                  summary: "Mostly Cloudy",
                  current_temperature: "72",
              },
              search_location: "Hong Kong"
    }}}

    expect(response).to be_successful
    expect(clean_response).to eq(expected_response_body)
  end
end