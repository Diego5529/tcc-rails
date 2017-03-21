class Api::UserType::UserTypeController < ApplicationController

	def index
		@ut = UserType.all
		render json: { user_type: @ut }
	end
end