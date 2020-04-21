class AntipodeSerializer
  include FastJsonapi::ObjectSerializer
  
    :id
    :type
    attributes :location_name,
              :search_location,   
              :summary,
              :current_temperature

end