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
            :current_sunrise,
            :current_sunset,
            :hourly_temp,
            :hourly_time,
            :daily_date_time,
            :daily_description,
            :daily_humidity,
            :daily_high,
            :daily_low
end
