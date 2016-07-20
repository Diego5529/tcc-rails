class Admin::EventCategoriesController < Admin::AdminsController
  def index
    @event_categories = EventCategory.all
  end

  def new
    @event_category = EventCategory.new
  end

  def create
    @event_category = EventCategory.create(permitted_columns)

    if @event_category.errors.any?
      render :new
    else
      redirect_to admin_event_categories_path
    end
  end

  def edit
    find_params
  end

  def update
    find_params
    @event_category.update_attributes(permitted_columns)

    redirect_to admin_event_categories_path
  end

  def show
    find_params
  end

  def destroy
    find_params
    if @event_category.destroy
      flash[:notice] = 'Delete success'
    else
      flash[:notice] = 'Delete error'
    end
    redirect_to admin_event_categories_path
  end

  private
    def permitted_columns
      params.require(:event_category).permit(:title, :short_description, :long_description)
    end

    def find_params
      @event_category = EventCategory.find(params[:id])
    end
end