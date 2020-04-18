require 'rails_helper'

RSpec.describe 'Destination images', type: 'request' do 
  it 'Can consume an api and return proper images for the destination if available' do 
    location = 'denver, co'

    get "/api/v1/backgrounds?location=#{location}"

    expect(response).to be_successful
  end
end
