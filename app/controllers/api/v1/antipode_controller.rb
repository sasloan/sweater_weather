class Api::V1::AntipodeController < ApplicationController

  def index
    starting_city = params[:location]
    antipode_facade = AntipodeFacade.new(starting_city)
    render json: AntipodeSerializer.new(antipode_facade.find_antipode)
  end
end