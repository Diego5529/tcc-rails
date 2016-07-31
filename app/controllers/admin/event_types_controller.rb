class Admin::EventTypesController < Admin::AdminsController
  before_action :set_admin_event_type, only: [:show, :edit, :update, :destroy]

  def index
    @event_types = EventType.all
  end

  def new
    @event_type = EventType.new
  end

  def create
    @event_type = EventType.create(permitted_columns)

    if @event_type.errors.any?
      render :new
    else
      redirect_to admin_event_types_path
    end
  end

  def edit
  end

  def update
    @event_type.update_attributes(permitted_columns)

    redirect_to admin_event_types_path
  end

  def show
  end

  def destroy
    if @event_type.destroy
      flash[:notice] = 'Delete success'
    else
      flash[:notice] = 'Delete error'
    end
    redirect_to admin_event_types_path
  end

  private
    def set_admin_event_type
      @event_type = EventType.find(params[:id])
    end

    def permitted_columns
      params.require(:event_type).permit(:title, :short_description, :long_description)
    end
end