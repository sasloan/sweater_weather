class ForecastService

  def locations_forecast(lat, lng)
    locations_forecast = conn.get("/data/2.5/onecall?lat=#{lat}&lon=#{lng}")
    get_json(locations_forecast)
  end



  private 

  def get_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.openweathermap.org") do |faraday|
      faraday.params["APPID"] = ENV["OPEN_WEATHER_API_KEY"]
    end
  end
end