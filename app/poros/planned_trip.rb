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
    @arrival_forecast = ((locations_forecast[:current][:temp] - 273.15) * 9/5 + 32).round(2)
    @weather_description = locations_forecast[:current][:weather].first[:description]
  end
end