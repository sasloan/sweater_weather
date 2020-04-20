class RoadTripSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id,
             :travel_time,
             :arrival_forecast,
             :weather_description,
             :lat,
             :lng
end