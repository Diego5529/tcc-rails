class Admin::EventTypesController < Admin::AdminsController
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
    find_params
  end

  def update
    find_params
    @event_type.update_attributes(permitted_columns)

    redirect_to admin_event_types_path
  end

  def show
    find_params
  end

  def destroy
    find_params
    if @event_type.destroy
      flash[:notice] = 'Delete success'
    else
      flash[:notice] = 'Delete error'
    end
    redirect_to admin_event_types_path
  end

  private
    def permitted_columns
      params.require(:event_type).permit(:title, :short_description, :long_description)
    end

    def find_params
      @event_type = EventType.find(params[:id])
    end
end