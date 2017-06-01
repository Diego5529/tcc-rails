class Api::City::CityController < ApplicationController

  def index
    cities = City.all
    render json: { cities: cities }
  end

  def show
    city = City.find(params[:id])
    render json: { city: city }
  end
end