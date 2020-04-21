class AntipodeForecast
  attr_reader :id,
              :location_name,
              :summary,
              :current_temperature,
              :search_location
  
  def initialize(forecast_data, antipode_data, start_data)
    @location_name = antipode_data[:results].first[:address_components][3][:long_name]
    @summary = forecast_data[:current][:weather].first[:description]
    @current_temperature = kelvin_to_fahrenheit(forecast_data[:current][:temp])
    @search_location = start_data[:results].first[:address_components].first[:long_name]
  end

  def kelvin_to_fahrenheit(kelvin)
    ((kelvin - 273.15) * 9/5 + 32).round(2)
  end
end