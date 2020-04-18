class DestinationImageSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id,
            :image_1,
            :image_2,
            :image_3,
            :image_4,
            :image_5
end
