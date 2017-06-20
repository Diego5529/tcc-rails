class Api::User::ProfileController < ApplicationController

  def show
    user = User.find_by_token(params[:token])

    render json: { user: user }
  end

  def user_by_email
    user = User.find_by_email(params[:email])

    if user
      puts user
      render json: user, serializer: nil
    else
      render json: { message: 'User not found.' }
    end
  end
end