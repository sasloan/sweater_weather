class Api::V1::ForecastController < ApplicationController
  before_action :authenticate
  
  def index 
    render json: DestinationForecastSerializer.new(DestinationForecastSearch.new(params[:location]).location_forecast)
  end
end