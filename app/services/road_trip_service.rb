class RoadTripService

  def travel_data(origin, destination)
    travel_data = conn.get("/maps/api/directions/json?origin=#{origin}&destination=#{destination}")
    get_json(travel_data)
  end

  private 

  def get_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://maps.googleapis.com') do |faraday|
      faraday.params["key"] = ENV["GOOGLE_GEO_CODE"]
    end
  end
end