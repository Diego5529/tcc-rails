class Api::User::SessionsController < ApplicationController

  def create
    @user = User.find_for_database_authentication(email: user_params[:email])
    
    return invalid_login_attempt unless @user.present?

    if @user.valid_password?(user_params[:password])
      @user.update_tracked_fields!(request)
      render json: @user, serializer: UserSerializer, status: :ok, root: :user
    else
      invalid_login_attempt
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def invalid_login_attempt
    render json: { errors: 'Invalid email or password.' }
  end
end