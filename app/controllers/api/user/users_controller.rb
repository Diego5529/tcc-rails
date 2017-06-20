class Api::User::UsersController < ApplicationController

  before_action :set_api_user, only: [:show, :update, :destroy]

  # GET /api/users
  def index
    @api_users = User.all

    render json: @api_users, serializer: nil
  end

  # GET /api/users/1
  def show
    render json: @api_user
  end

  # POST /api/users
  def create
    @api_user = User.new(api_user_params)

    if @api_user.save
      render json: @api_user, status: :created, location: @api_user
    else
      render json: @api_user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/users/1
  def update
    if @api_user.update(api_user_params)
      render json: @api_user
    else
      render json: @api_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/users/1
  def destroy
    @api_user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_user
      @api_user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_user_params
      params.require(:api_user).permit(:title, :short_description, :long_description, :city_id, :address, :address_complement, :number, :district, :zip_code, :latitude, :longitude, :url_site, :facebook_page, :initial_date, :end_date, :initial_hour, :end_hour, :status, :note, :archive, :user_type_id, :user_category_id, :use_password, :password, :confirm_password, :min_users, :max_users, :company_id)
    end
end