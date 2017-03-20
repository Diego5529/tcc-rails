class Api::User::RegistrationsController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created, root: :user
    else
      render json: @user.errors.full_messages
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end