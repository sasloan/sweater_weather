class Api::V1::ForecastController < ApplicationController
  # This action requires that api key that is being passed in matches the api key of the user in the database
  before_action :authenticate
  # This line of code tells the authentication not to look for a specific token in the params to identify
  skip_before_action :verify_authenticity_token
  # This is the controller method that passes a location included in the params of the request
  # to the facade which takes in the service and the poro to gather data then organize the data
  # into objects, after which the data is sent back to the controller then rendered with the 
  # Serializer to create an api endpoint. 
  def index 
    destination = params[:location]
    render json: DestinationForecastSerializer.new(DestinationForecastSearch.new(destination).location_forecast)
  end
end