class Api::V1::ForecastController < ApplicationController
  before_action :authenticate
  
  def index 
    destination = params[:location]
    render json: DestinationForecastSerializer.new(DestinationForecastSearch.new(destination).location_forecast)
  end
end