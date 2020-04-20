require 'rails_helper'

RSpec.describe 'Destination images', type: 'request' do 
  before :each do 
    @user = create(:user)
  end
  
  it 'Can consume an api and return proper images for the destination if available' do 
    location = 'denver, co'

    get "/api/v1/backgrounds?location=#{location}&api_key=#{@user.api_key}"

    expect(response).to be_successful
  end

  it 'I cannot access this end point if my api key is invalid' do

    location = "denver,co"

    get "/api/v1/backgrounds?api_key='hello motto'&location=#{location}"

    expect(response).not_to be_successful
  end
end
