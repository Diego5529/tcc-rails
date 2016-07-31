class Admin::EventsController < Admin::AdminsController
  before_action :set_admin_event, only: [:show, :edit, :update, :destroy]

  def index
    @admin_events = Event.all
  end

  def show
  end

  def new
    @admin_event = Event.new
  end

  def edit
  end

  def create
    @admin_event = Event.create(permitted_columns)

    if @admin_event.errors.any?
      render :new
    else
      redirect_to admin_events_path
    end
  end

  def update
    @admin_event.update_attributes(permitted_columns)

    redirect_to admin_events_path
  end

  def destroy
    if @admin_event.destroy
      flash[:notice] = 'Delete success'
    else
      flash[:notice] = 'Delete error'
    end
    redirect_to admin_events_path
  end

  private
    def set_admin_event
      @admin_event = Event.find(params[:id])
    end

    def permitted_columns
      params.require(:event).permit(:title, :short_description, :long_description, :city_id, :address, :address_complement, :number, :district, :zip_code, :latitude, :longitude, :url_site, :facebook_page, :initial_date, :end_date, :initial_hour, :end_hour, :status, :note, :archive, :event_type_id, :event_category_id, :use_password, :password, :confirm_password, :min_users, :max_users, :company_id)
    end
end
