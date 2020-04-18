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
    @current_temp = forecast_data[:current][:temp]
    @feels_like = forecast_data[:current][:temp]
    @humidity = forecast_data[:current][:humidity]
    @visibility = forecast_data[:current][:visibility]
    @uv_index = forecast_data[:current][:uvi]
    @hourly_temp = forecast_data[:hourly].first[:temp]
    @current_sunrise = forecast_data[:current][:sunrise]
    @current_sunset = forecast_data[:current][:sunset]
    @friday = forecast_data[:daily][0]
    @saturday = forecast_data[:daily][1]
    @sunday = forecast_data[:daily][2]
    @monday = forecast_data[:daily][3]
    @tuesday = forecast_data[:daily][4]
    @wednesday = forecast_data[:daily][5]
    @thursday = forecast_data[:daily][6]
  end
end