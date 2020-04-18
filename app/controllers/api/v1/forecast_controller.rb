class Api::V1::ForecastController < ApplicationController

  def index 
    address = params[:location]
    coordinates = DestinationForecastSearch.new(address)
    location_forecast = coordinates.location_forecast
    render json: DestinationForecastSerializer.new(location_forecast)
  end
end