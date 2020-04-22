class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @user = User.new(user_params)

    if @user.save
      render json: UsersSerializer.new(@user)
    else
      render json: {status: 401}
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end