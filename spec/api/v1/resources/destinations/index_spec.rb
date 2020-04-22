require 'rails_helper'

RSpec.describe 'Destination weather', type: 'request' do 
  before :each do 
    @user = create(:user)
  end

  it 'There should be an endpoint that has the data needed for a destinations weather show page', :vcr do

    location = "denver,co"

    get "/api/v1/forecast?location=#{location}&api_key=#{@user.api_key}"

    clean_response = JSON.parse(response.body, symbolize_names: true)

    expected_response_body = {:data=>
    {:id=>nil,
     :type=>"destination_forecast",
     :attributes=>
      {:id=>nil,
       :lat=>39.7392358,
       :lng=>-104.990251,
       :current_temp=>42.44,
       :feels_like=>42.44,
       :humidity=>60,
       :visibility=>16093,
       :uv_index=>7.57,
       :current_sunrise=>"2020-04-22 06:11:21 -0600",
       :current_sunset=>"2020-04-22 19:44:58 -0600",
       :hourly_temp=>42.44,
       :hourly_time=>"2020-04-22T06:00:00.000-06:00",
       :daily_date_time=>"2020-04-22T12:00:00.000-06:00",
       :daily_description=>"broken clouds",
       :daily_humidity=>24,
       :daily_high=>64.09,
       :daily_low=>42.44}
       }}

    expect(response).to be_successful

    destinations = JSON.parse(response.body)
    expect(clean_response).to eq(expected_response_body)
  end

  it 'I cannot access this end point if my api key is invalid' do

    location = "denver,co"

    get "/api/v1/forecast?api_key='hello motto'&location=#{location}"

    expect(response).not_to be_successful
    expect(response.body).to eq("Bad credentials")
  end
end