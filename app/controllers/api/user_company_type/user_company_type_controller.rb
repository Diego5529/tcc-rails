class Api::UserCompanyType::UserCompanyTypeController < ApplicationController

  def index
    user_company_types = UserCompanyType.all
    render json: { user_company_types: user_company_types }
  end

  def company_types_by_user
    user_company_types = User.find(params[:id]).user_company_types.all.where(active: true)
    render json: { company_types_by_user: user_company_types }
  end

  def show
    user_company_type = UserCompanyType.find(params[:id])
    render json: { user_company_type: user_company_type }
  end
end