require 'rails_helper'

RSpec.describe 'A valid user can access roadtrip data', type: 'request' do
  before :each do
    @user = create(:user)

    post "/api/v1/sessions?email=#{@user.email}&password=#{@user.password}"
    
    expect(response).to be_successful
  end

  it 'If the user has a valid api key, they can access the data!', :vcr do 
    
    origin = "Denver,CO"
    destination = "Pueblo,CO"
    api_key = @user.api_key

    post "/api/v1/road_trip?origin=#{origin}&destination=#{destination}&api_key=#{api_key}"

    clean_response = JSON.parse(response.body, symbolize_names: true)

    expected_response_body = {:data => 
      {:attributes=>  
        {:arrival_forecast=>59.99, 
        :id=>nil, 
        :lat=>38.2544472, 
        :lng=>-104.6091409, 
        :travel_time=>"1 hour 48 mins", 
        :weather_description=>"clear sky"}, 
        :id=>nil, 
        :type=>"road_trip"}
    }
    
    expect(response).to be_successful
    expect(clean_response).to eq(expected_response_body)
  end

  it 'If the user has a invalid api key, they can not access the data!', :vcr do 
    
    origin = "Denver,CO"
    destination = "Pueblo,CO"
    api_key = @user.api_key

    post "/api/v1/road_trip?origin=#{origin}&destination=#{destination}&api_key='hello motto'"

    expect(response).not_to be_successful
    end

    it 'If the user does not supply all the required params it get a 401 error.', :vcr do 
      
    origin = "Denver,CO"
    destination = "Pueblo,CO"
    api_key = @user.api_key

    post "/api/v1/road_trip?origin=#{origin}&api_key=hellomoto"

    expected_response_body = "Bad credentials"
    
    expect(response.body).to eq(expected_response_body)
  end
end
