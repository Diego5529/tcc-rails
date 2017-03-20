class Api::User::AccountController < ApplicationController
  before_action :authenticate

  def update
    if @user.update(account_params)
      head :ok
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update_password
    if @user.update(password_params)
      render json: { message: 'Your account has been successfully changed!' }
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def account_params
    params.require(:user).permit(:name, :email)
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end