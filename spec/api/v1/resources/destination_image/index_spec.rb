require 'rails_helper'

RSpec.describe 'Destination images', type: 'request' do 
  before :each do 
    @user = create(:user)
  end
  
  it 'Can consume an api and return proper images for the destination if available', :vcr do 
    location = 'denver, co'

    get "/api/v1/backgrounds?location=#{location}&api_key=#{@user.api_key}"

    clean_response = JSON.parse(response.body, symbolize_names: true)

    expected_response_body =  {
      :data=>
        {:id=>nil,
        :type=>"destination_image",
        :attributes=>
          {:id=>nil,
          :image_1=>"https://images.pexels.com/photos/3184423/pexels-photo-3184423.jpeg",
          :image_2=>"https://images.pexels.com/photos/3626622/pexels-photo-3626622.jpeg",
          :image_3=>"https://images.pexels.com/photos/3153198/pexels-photo-3153198.jpeg",
          :image_4=>"https://images.pexels.com/photos/3183165/pexels-photo-3183165.jpeg",
          :image_5=>"https://images.pexels.com/photos/2566581/pexels-photo-2566581.jpeg"
          }
        }
      }

    expect(response).to be_successful
    expect(clean_response).to eq(expected_response_body)
  end

  it 'I cannot access this end point if my api key is invalid' do

    location = "denver,co"

    get "/api/v1/backgrounds?api_key='hello motto'&location=#{location}"

    expect(response).not_to be_successful
    expect(response.body).to eq("Bad credentials")
  end
end
