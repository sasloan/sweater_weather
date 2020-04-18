class DestinationForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
              :lat,
              :lng,
              :current_temp,
              :feels_like,
              :humidity,
              :visibility,
              :uv_index,
              :hourly_temp,
              :current_sunrise,
              :current_sunset,
              :friday,
              :saturday,
              :sunday,
              :monday,
              :tuesday,
              :wednesday,
              :thursday
end
