class Api::User::OmniauthCallbacksController < ApplicationController
  def create
    @user = User.from_omniauth(user_params)

    if @user.save
      @user.update_tracked_fields!(request)
      render json: @user, serializer: UserSerializer, status: :ok, root: :user
    else
      head :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :provider, :uid, :name)
  end
end