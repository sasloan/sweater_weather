class Api::V1::AntipodeController < ApplicationController

  def index
    antipode = params[:location]
    render json: AntipodeSerializer.new(AntipodeFacade.new(antipode).find_antipode)
  end
end