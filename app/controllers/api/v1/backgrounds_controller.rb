class Api::V1::BackgroundsController < ApplicationController

  def index
    location = params[:location]
    background_images = DestinationBackground.new(location)
    images = background_images.location_background_images
    render json: DestinationImageSerializer.new(images)
  end
end