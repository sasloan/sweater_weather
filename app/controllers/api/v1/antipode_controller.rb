class Api::V1::AntipodeController < ApplicationController

  def index
    starting_city = params[:location]
    antipode_facade = AntipodeFacade.new(starting_city)
    antipode_facade.find_antipode
  end
end