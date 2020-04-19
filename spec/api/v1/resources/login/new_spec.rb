require 'rails_helper'

RSpec.describe 'A Valid user can log into the api', type: 'request' do 
  before :each do 
    @user = create(:user)
  end

  it 'A valid user can send a post request to log into the api' do 

    post "/api/v1/sessions?email=#{@user.email}&password=#{@user.password}"

    clean_response = JSON.parse(response.body, symbolize_names: true)

    response_body = {
      "data": {
        "type": "users",
        "id": @user.id,
        "attributes": {
          "email": @user.email,
          "api_key": clean_response[:data][:attributes][:api_key]
        }
      }
    }

    expect(response).to be_successful
    expect(clean_response).to eq(response_body)
  end
end
