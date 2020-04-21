class LocationCoordinates
  attr_reader :id,
              :lat,
              :lng,
              :current_temp,
              :feels_like,
              :humidity,
              :visibility,
              :uv_index,
              :hourly_temp,
              :current_sunrise,
              :current_sunset,
              :friday,
              :saturday,
              :sunday,
              :monday,
              :tuesday,
              :wednesday,
              :thursday


  def initialize(coordinate_data, forecast_data)
    @lat = coordinate_data[:results].first[:geometry][:location][:lat]
    @lng = coordinate_data[:results].first[:geometry][:location][:lng]
    @current_temp = kelvin_to_fahrenheit(forecast_data[:current][:temp])
    @feels_like = forecast_data[:current][:temp]
    @humidity = forecast_data[:current][:humidity]
    @visibility = forecast_data[:current][:visibility]
    @uv_index = forecast_data[:current][:uvi]
    @hourly_temp = kelvin_to_fahrenheit(forecast_data[:hourly].first[:temp])
    @current_sunrise = Time.at(forecast_data[:current][:sunrise]).to_s
    @current_sunset = Time.at(forecast_data[:current][:sunset]).to_s
    @friday = forecast_data[:daily][0]
    @saturday = forecast_data[:daily][1]
    @sunday = forecast_data[:daily][2]
    @monday = forecast_data[:daily][3]
    @tuesday = forecast_data[:daily][4]
    @wednesday = forecast_data[:daily][5]
    @thursday = forecast_data[:daily][6]
  end

  def kelvin_to_fahrenheit(kelvin)
    ((kelvin - 273.15) * 9/5 + 32).round(2)
  end
end