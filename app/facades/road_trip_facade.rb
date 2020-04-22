class RoadTripFacade 
  attr_reader :origin,
              :destination

  def initialize(params)
    @origin = params[:origin]
    @destination = params[:destination]
  end

  def travel_info
    travel_info = road_trip_service.travel_data(@origin, @destination)
    coordinates = location_service.coordinates(@destination)
    lat = coordinates[:results].first[:geometry][:location][:lat]
    lng = coordinates[:results].first[:geometry][:location][:lng]
    locations_forecast = forecast_service.locations_forecast(lat, lng)
    planned_trip = PlannedTrip.new(travel_info, lat, lng, locations_forecast)
  end

  def road_trip_service
    RoadTripService.new
  end

  def location_service
    LocationService.new 
  end

  def forecast_service
    ForecastService.new
  end
end