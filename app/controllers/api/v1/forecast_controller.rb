class Api::V1::ForecastController < ApplicationController
  before_action :authenticate
  
  def index 
    address = params[:location]
    coordinates = DestinationForecastSearch.new(address)
    location_forecast = coordinates.location_forecast
    render json: DestinationForecastSerializer.new(location_forecast)
  end
end