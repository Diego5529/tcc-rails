class Api::Company::CompanyController < ApplicationController

  def index
    companies = Company.all
    render json: { companies: companies }
  end

  def show
    company = Company.find(params[:id])
    render json: { company: company }
  end
end