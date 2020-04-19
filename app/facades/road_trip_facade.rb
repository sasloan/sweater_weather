class RoadTripFacade 
  attr_reader :origin,
              :destination

  def initialize(params)
    @origin = params[:origin]
    @destination = params[:destination]
  end

  def travel_info
    road_trip_service = RoadTripService.new
    travel_info = road_trip_service.travel_data(@origin, @destination)
    location_service = LocationService.new  
    coordinates = location_service.coordinates(@destination)
    lat = coordinates[:results].first[:geometry][:location][:lat]
    lng = coordinates[:results].first[:geometry][:location][:lng]
    forecast_service = ForecastService.new
    locations_forecast = forecast_service.locations_forecast(lat, lng)
    planned_trip = PlannedTrip.new(travel_info, coordinates, locations_forecast)
  end
end