class Api::V1::SessionsController < ApplicationController

  def create
    @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])

    if @user
      session[:id] = @user.id
      render json: SessionSerializer.new(@user)
    else
      render status: :bad_request
    end
  end
end