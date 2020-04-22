class LocationCoordinates
  # this the attr_reader that allows other files to read the data provided in the initialize, 
  # but does not allow them to modify it. 
  attr_reader :id,
              :lat,
              :lng,
              :current_temp,
              :feels_like,
              :humidity,
              :visibility,
              :uv_index,
              :current_sunrise,
              :current_sunset,
              :hourly_temp,
              :hourly_time,
              :daily_date_time,
              :daily_description,
              :daily_humidity,
              :daily_high,
              :daily_low
          


  def initialize(lat, lng, forecast_data)
    # this is the lattitude for the forecast data we are gathering in the facade
    @lat = lat
    # this is the longitude data for the forecast data we agathering in the facade
    @lng = lng
    # this is the current tempurtuer of the location provided 
    @current_temp = kelvin_to_fahrenheit(forecast_data[:current][:temp])
    # this is the temperature that it feels like at our location
    @feels_like = kelvin_to_fahrenheit(forecast_data[:current][:temp])
    # this is the humidity of the location
    @humidity = forecast_data[:current][:humidity]
    # this is the visibility of the location
    @visibility = forecast_data[:current][:visibility]
    # this is the uv_index of the location.
    @uv_index = forecast_data[:current][:uvi]
    # this is the time the sun rose on this location
    @current_sunrise = Time.at(forecast_data[:current][:sunrise]).to_s
    # this is the time the sun set on this location
    @current_sunset = Time.at(forecast_data[:current][:sunset]).to_s
    # this is the hourly time provided by the api that changes to reflect the hour in the day
    @hourly_time = time_to_read(forecast_data[:hourly].first[:dt])
    # this is the hourly temp of any given day
    @hourly_temp = kelvin_to_fahrenheit(forecast_data[:hourly].first[:temp])
    # this is the daily date time, provided to make sure the day data matches the view info
    @daily_date_time = time_to_read(forecast_data[:daily].first[:dt])
    # this is the daily weather description
    @daily_description = forecast_data[:daily].first[:weather].first[:description]
    # This is the daily humidity forecast
    @daily_humidity = forecast_data[:daily].first[:humidity]
    # this is the daily high forecast
    @daily_high = kelvin_to_fahrenheit(forecast_data[:daily].first[:temp][:max])
    # this is the daily low forecast
    @daily_low = kelvin_to_fahrenheit(forecast_data[:daily].first[:temp][:min])
  end
  # this method takes in a kelvin number and converts it to fahrenheit 
  def kelvin_to_fahrenheit(kelvin)
    ((kelvin - 273.15) * 9/5 + 32).round(2)
  end
  # this method takes in a string of numbers provided by the weather service and converts it into 
  # legable time. 
  def time_to_read(time)
    Time.at(time)
  end
end