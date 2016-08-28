class Api::User::PasswordsController < ApplicationController
  def new
    redirect_to "tcc-rails://reset-password?token=#{params[:token]}"
  end

  def create
    @user = User.find_by(create_params)

    if @user && @user.send_reset_password_instructions
      head :ok
    else
      head :not_found
    end
  end

  def update
    @user = User.reset_password_by_token(update_params)

    if @user.errors.empty?
      head :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def create_params
    params.require(:user).permit(:email)
  end

  def update_params
    params.require(:user).permit(:reset_password_token, :password, :password_confirmation)
  end
end