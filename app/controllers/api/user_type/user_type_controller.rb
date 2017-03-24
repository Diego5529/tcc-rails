class Api::UserType::UserTypeController < ApplicationController

  def index
    user_types = UserType.all
    render json: { user_types: user_types }
  end

  def show
    user_type = UserType.find(params[:id])
    render json: { user_type: user_type }
  end
end