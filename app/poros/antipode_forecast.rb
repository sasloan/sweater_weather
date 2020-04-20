class AntipodeForecast
  attr_reader :id,
              :location_name,
              :summary,
              :current_temperature,
              :search_location
  
  def initialize(forecast_data, antipode_data, start_data)
    @location_name = antipode_data[:results].first[:address_components][3][:long_name]
    @summary = forecast_data[:current][:weather].first[:description]
    @current_temperature = ((forecast_data[:current][:temp] - 273.15) * 9/5 + 32).round(2)
    @search_location = start_data[:results].first[:address_components].first[:long_name]
  end
end