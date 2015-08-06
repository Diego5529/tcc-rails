class SessionsController < ApplicationController

  def new
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    p '////', params[:session][:password], '@@@@@@@@@@@@@@@@', @user
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to 'login'
    end
  end
end