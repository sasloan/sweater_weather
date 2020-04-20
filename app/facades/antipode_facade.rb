class AntipodeFacade 
  attr_reader :starting_city

  def initialize(starting_city)
    @starting_city = starting_city
  end
  
  def find_antipode
    location_service = LocationService.new
    starting_lat = location_service.coordinates(@starting_city)[:results].first[:geometry][:location][:lat]
    starting_lng = location_service.coordinates(@starting_city)[:results].first[:geometry][:location][:lng]  
    antipode_service = AntipodeService.new
    ending_lat = antipode_service.antipode_coordinates(starting_lat, starting_lng)[:data][:attributes][:lat]
    ending_lng = antipode_service.antipode_coordinates(starting_lat, starting_lng)[:data][:attributes][:long]
    antipode_lat = location_service.reverse_geocode(ending_lat, ending_lng)[:results].first[:geometry][:location][:lat]
    antipode_lng = location_service.reverse_geocode(ending_lat, ending_lng)[:results].first[:geometry][:location][:lng]
    forecast_service = ForecastService.new
    ending_forecast = forecast_service.locations_forecast(ending_lat, ending_lng)
    antipode_forecast = AntipodeForecast.new(ending_forecast, location_service.reverse_geocode(ending_lat, ending_lng), location_service.coordinates(@starting_city))
  end
end