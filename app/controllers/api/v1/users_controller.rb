class Api::V1::UsersController < ApplicationController

  def create
    @user = User.new(user_params)

    if @user.save
      render :create
    else
      render status: :bad_request
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end