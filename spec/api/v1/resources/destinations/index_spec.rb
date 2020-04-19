require 'rails_helper'

RSpec.describe 'Destination weather', type: 'request' do 
  before :each do 
    @user = create(:user)
  end

  it 'There should be an endpoint that has the data needed for a destinations weather show page' do

    location = "denver,co"

    get "/api/v1/forecast?location=#{location}&api_key=#{@user.api_key}"

    expect(response).to be_successful

    destinations = JSON.parse(response.body)


  end
end