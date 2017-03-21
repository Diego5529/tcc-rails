class Api::Company::CompanyController < ApplicationController

	def index
		@company = Company.all
	end
end