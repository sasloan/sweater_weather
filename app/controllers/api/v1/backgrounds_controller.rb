class Api::V1::BackgroundsController < ApplicationController
  before_action :authenticate
  
  def index
    render json: DestinationImageSerializer.new(DestinationBackground.new(params[:location]).location_background_images)
  end
end