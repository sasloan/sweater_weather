class Api::V1::RoadTripController < ApplicationController

  def create
    origin = params["origin"]
    destination = params["destination"]
    road_trip = RoadTripFacade.new(params)
    trip_info = road_trip.travel_info

    if trip_info
      render json: {
        origin: origin,
        destination: destination,
        travel_time: trip_info.travel_time,
        arrival_forecast: "#{trip_info.arrival_forecast}, #{trip_info.weather_description}"
      }
    else
      render json: {status: 401}
    end
  end
end