class Api::UserCompanyType::UserCompanyTypeController < ApplicationController

	def index
		@uct = User.find(params[:id]).user_company_types.all.where(active: true)
		render json: { user_company_types: @uct }
	end
end