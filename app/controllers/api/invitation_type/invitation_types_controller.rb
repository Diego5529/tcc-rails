class Api::InvitationType::InvitationTypesController < ApplicationController

  before_action :set_api_invitation_type, only: [:show, :update, :destroy]

  # GET /api/invitation_types
  def index
    @api_invitation_types = InvitationType.all

    render json: @api_invitation_types, serializer: nil
  end

  # GET /api/invitation_types/1
  def show
    render json: @api_invitation_type
  end

  # POST /api/invitation_types
  def create
    @api_invitation_type = InvitationType.new(api_invitation_type_params)

    if @api_invitation_type.save
      render json: @api_invitation_type, status: :created, location: @api_invitation_type
    else
      render json: @api_invitation_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/invitation_types/1
  def update
    if @api_invitation_type.update(api_invitation_type_params)
      render json: @api_invitation_type
    else
      render json: @api_invitation_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/invitation_types/1
  def destroy
    @api_invitation_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_invitation_type
      @api_invitation_type = InvitationType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_invitation_type_params
      params.require(:api_invitation_type).permit(:title, :short_description, :long_description, :city_id, :address, :address_complement, :number, :district, :zip_code, :latitude, :longitude, :url_site, :facebook_page, :initial_date, :end_date, :initial_hour, :end_hour, :status, :note, :archive, :invitation_type_type_id, :invitation_type_category_id, :use_password, :password, :confirm_password, :min_invitation_types, :max_invitation_types, :company_id)
    end
end