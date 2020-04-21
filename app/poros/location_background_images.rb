class LocationBackgroundImages
  attr_reader :id,
              :image_1,
              :image_2,
              :image_3,
              :image_4,
              :image_5

  def initialize(image_data)
    @image_1 = image_data[:photos][0][:src][:original]
    @image_2 = image_data[:photos][1][:src][:original]
    @image_3 = image_data[:photos][2][:src][:original]
    @image_4 = image_data[:photos][3][:src][:original]
    @image_5 = image_data[:photos][4][:src][:original]
  end
end