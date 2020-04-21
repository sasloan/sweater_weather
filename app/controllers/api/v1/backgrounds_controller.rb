class Api::V1::BackgroundsController < ApplicationController
  before_action :authenticate
  
  def index
    destination = params[:location]
    render json: DestinationImageSerializer.new(DestinationBackground.new(destination).location_background_images)
  end
end