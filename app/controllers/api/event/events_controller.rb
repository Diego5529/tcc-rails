class Api::Event::EventsController < ApplicationController
  before_action :set_api_event, only: [:show, :update, :destroy]

  # GET /api/events
  def index
    @api_events = Event.all

    render json: @api_events
  end

  # GET /api/events/1
  def show
    render json: @api_event
  end

  # POST /api/events
  def create
    @api_event = Event.new(api_event_params)

    if @api_event.save
      render json: @api_event, status: :created, location: @api_event
    else
      render json: @api_event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/events/1
  def update
    if @api_event.update(api_event_params)
      render json: @api_event
    else
      render json: @api_event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/events/1
  def destroy
    @api_event.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_event
      @api_event = Event.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_event_params
      params.require(:api_event).permit(:title, :short_description, :long_description, :city_id, :address, :address_complement, :number, :district, :zip_code, :latitude, :longitude, :url_site, :facebook_page, :initial_date, :end_date, :initial_hour, :end_hour, :status, :note, :archive, :event_type_id, :event_category_id, :use_password, :password, :confirm_password, :min_users, :max_users, :company_id)
    end
end
