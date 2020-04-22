class Api::V1::AntipodeController < ApplicationController
  before_action :authenticate
  skip_before_action :verify_authenticity_token
  
  def index
    antipode = params[:location]
    render json: AntipodeSerializer.new(AntipodeFacade.new(antipode).find_antipode)
  end
end