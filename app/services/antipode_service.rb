class AntipodeService 

  def antipode_coordinates(lat, lng)
    antipode_coordinates = conn.get("/api/v1/antipodes?lat=#{lat}&long=#{lng}")
    get_json(antipode_coordinates)
  end

  private

  def get_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "http://amypode.herokuapp.com") do |faraday|
      faraday.headers["api_key"] = ENV["AMYPODE_API_KEY"]
    end
  end
end