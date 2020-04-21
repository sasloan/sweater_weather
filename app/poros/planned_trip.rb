class PlannedTrip
  attr_reader :id,
              :travel_time,
              :arrival_forecast,
              :weather_description,
              :lat,
              :lng

  def initialize(travel_info, coordinates, locations_forecast)
    @lat = coordinates[:results].first[:geometry][:location][:lat]
    @lng = coordinates[:results].first[:geometry][:location][:lng]
    @travel_time = travel_info[:routes].first[:legs].first[:duration][:text]
    @arrival_forecast = kelvin_to_fahrenheit(locations_forecast[:current][:temp])
    @weather_description = locations_forecast[:current][:weather].first[:description]
  end

  def kelvin_to_fahrenheit(kelvin)
    ((kelvin - 273.15) * 9/5 + 32).round(2)
  end
end