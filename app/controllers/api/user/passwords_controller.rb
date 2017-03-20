class Api::User::PasswordsController < ApplicationController
  def new
    redirect_to "tcc-swift3://reset-password?token=#{params[:token]}"
  end

  def create
    @user = User.find_by(create_params)

    if @user
      if @user.send_reset_password_instructions
        render json: { message: "We sent an email to #{@user.email}, reset your password" } 
      else
        head :not_found
      end
    else
      render json: { errors: 'Email not found' } 
    end
  end

  def update
    @user = User.reset_password_by_token(update_params)

    if @user.errors.empty?
      render json: { message: 'Your password has been changed successfully.' }
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
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