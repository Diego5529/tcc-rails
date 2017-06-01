class Api::Country::CountryController < ApplicationController

  def index
    countries = Country.all
    render json: { countries: countries }
  end

  def show
    country = Country.find(params[:id])
    render json: { country: country }
  end
end