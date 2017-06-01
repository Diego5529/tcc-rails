class Api::User::ProfileController < ApplicationController

  def show
    token = "#{params[:token]}"
    puts "++++", token, "+++++"
    @user = User.find_by_token(params[:token])
    puts "=====", token, "////////", @user, "0000000"
    render json: { user: @user }
  end

  def user_by_email
    token = "#{params[:email]}"
    puts "++++", token, "+++++"
    user = User.find_by_email(params[:email])

    if user
      render json: { user: user }
    else
      render json: {message: 'User not found.'}
    end
  end
end