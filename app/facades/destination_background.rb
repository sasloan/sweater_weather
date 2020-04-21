class DestinationBackground
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def location_background_images
    image_data = service.location_background(@location)
    images = LocationBackgroundImages.new(image_data)
  end

  def service
    BackgroundService.new
  end
end