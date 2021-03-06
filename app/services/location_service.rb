class LocationService 

  def coordinates(location)
    coordinates = conn.get("/maps/api/geocode/json?address=#{location}")
    get_json(coordinates)
  end

  def reverse_geocode(lat, lng)
    reverse_geocode = conn.get("/maps/api/geocode/json?latlng=#{lat},#{lng}") 
    get_json(reverse_geocode)
  end

  private

  def get_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://maps.googleapis.com") do |faraday|
      faraday.params["key"] = ENV["GOOGLE_GEO_CODE"]
      faraday.params['units'] = 'imperial'
    end
  end
end