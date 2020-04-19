class Api::V1::SessionsController < ApplicationController

  def create
    @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])

    if @user
      session[:id] = @user.id
      render json: {
        data: {
          type: 'users',
          id: @user.id,
          attributes: {
            email: @user.email,
            api_key: @user.api_key
          }
        }
      }
    else
      render json: {status: 401}
    end
  end
end