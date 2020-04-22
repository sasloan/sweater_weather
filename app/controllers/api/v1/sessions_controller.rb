class Api::V1::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])

    if @user
      session[:id] = @user.id
      render json: SessionSerializer.new(@user)
    else
      render json: {status: 401}
    end
  end
end