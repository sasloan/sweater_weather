class Api::V1::AntipodeController < ApplicationController

  def index
    starting_city = params[:location]
    location_service = LocationService.new
    lat = location_service.coordinates(starting_city)[:results].first[:geometry][:location][:lat]
    lng = location_service.coordinates(starting_city)[:results].first[:geometry][:location][:lng]

    conn = Faraday.new(url: "http://amypode.herokuapp.com") do |faraday|
      faraday.headers["api_key"] = ENV["AMYPODE_API_KEY"]
    end

    response = conn.get("/api/v1/antipodes?lat=#{lat}&long=#{lng}")
    
    json = JSON.parse(response.body, symbolize_names: true)

    require 'pry'; binding.pry
  end
end