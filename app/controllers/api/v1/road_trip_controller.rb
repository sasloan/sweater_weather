class Api::V1::RoadTripController < ApplicationController
  before_action :authenticate
  
  def create
    road_trip = RoadTripFacade.new(params)
    trip_info = road_trip.travel_info

    if trip_info
      render json: RoadTripSerializer.new(trip_info)
    else
      render json: {status: 401}
    end
  end
end