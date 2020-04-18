class DestinationForecastSearch
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def location_forecast
    location_service = LocationService.new
    coordinate_data = location_service.coordinates(@location)
    forecast_service = ForecastService.new
    lat = coordinate_data[:results].first[:geometry][:location][:lat]
    lng = coordinate_data[:results].first[:geometry][:location][:lng]
    forecast_data = forecast_service.locations_forecast(lat, lng)
    location_coordinates = LocationCoordinates.new(coordinate_data, forecast_data)
  end
end