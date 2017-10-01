class Api::Company::CompanyController < ApplicationController

  def index
    companies = Company.all
    render json: { companies: companies }
  end

  def show
    company = Company.find(params[:id])
    render json: { company: company }
  end

  def update
    puts '===+====', params[:id], '===-====='
    company = Company.update(update_params)
    if company
      head :ok
    else
      render json: company.errors.full_messages, status: :unprocessable_entity
    end
  end

  def create
    puts '=======', params[:title], '========'
    @company = Company.new(create_params)
    if @company.save
      render json: @company, status: :created, root: :company
    else
      render json: @company.errors.full_messages
    end
  end

  private
  def create_params
    params.require(:company).permit(:title, :short_description, :long_description, :min_users, :max_users)
  end

  def update_params
    params.require(:company).permit(:title, :short_description, :long_description, :min_users, :max_users)
  end
end