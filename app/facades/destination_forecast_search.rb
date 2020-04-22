class DestinationForecastSearch
  # The attr_reader allows for the defined variables to be read by other files accessing this file.
  attr_reader :location
  # The initialize method tells the class what attributes are required for this class in this 
  # case the initialize requires a location to function correctly
  def initialize(location)
    @location = location
  end
  # location forecast is a method that takes in the google maps api service then the endpoint 
  # from the service takes in the location defined above in the initialize and returns coordinate
  # data, from that data we extract the lattitude and Longitude of the location that was given, next
  # we then send the lat and lng to another service that we call into this facade called the forecast
  # service, this service consumes the weather api data, once the weather api data receives the 
  # lat and lng of a location the forecast data for that location is then returned, finally the 
  # data provided for both the location and the forecast are sent to the LocationCoordinates poro
  # which turns each piece of data into a more readable and manageable object that is then returned to the 
  # facade here to be pushed to the controller. 

  def location_forecast
    # This line takes the location that is passed in from the controller and uses the google maps
    # api service to return the data for this location
    coordinate_data = location_service.coordinates(@location)
    # This line takes the data that was returned from the above line and extracts the locations
    # Lattitude
    lat = coordinate_data[:results].first[:geometry][:location][:lat]
    # This line takes the data that was returned from the above line and extracts the locations
    # Longitude
    lng = coordinate_data[:results].first[:geometry][:location][:lng]
    # this line accesses the weather service api and passes the endpoint the lat and lng that we
    # obtained above from the google maps api and then we consume the data returned from the weather
    # api. 
    forecast_data = forecast_service.locations_forecast(lat, lng)
    # this line calls on the poro that was created to manage the date we collected from above,
    # turning it into objects then passing it back to the facade that will later then be passed
    # to the controller and the serializer. 
    location_coordinates = LocationCoordinates.new(lat, lng, forecast_data)
  end

  # This Method accesses the google maps api to gain location data on a given location
  def location_service
    # This line is actually creating a new instance of the service that consumes the google api
    LocationService.new
  end
  # This Method accesses the weather data api to gain the weather data of a lattitude and longitude
  # coordinate base.
  def forecast_service
    # This line is actually creating a new instance of the service that consumes the weather api
    ForecastService.new
  end
end