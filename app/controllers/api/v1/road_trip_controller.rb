class Api::V1::RoadTripController < ApplicationController
  before_action :authenticate
  skip_before_action :verify_authenticity_token
  
  def create
    if RoadTripFacade.new(params).travel_info
      render json: RoadTripSerializer.new(RoadTripFacade.new(params).travel_info)
    else
      render json: {status: 401}
    end
  end
end