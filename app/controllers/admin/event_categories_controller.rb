class Admin::EventCategoriesController < Admin::AdminsController
  before_action :set_admin_event_category, only: [:show, :edit, :update, :destroy]

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
  end

  def update
    @event_category.update_attributes(permitted_columns)

    redirect_to admin_event_categories_path
  end

  def show
  end

  def destroy
    if @event_category.destroy
      flash[:notice] = 'Delete success'
    else
      flash[:notice] = 'Delete error'
    end
    redirect_to admin_event_categories_path
  end

  private
    def set_admin_event_category
      @event_category = EventCategory.find(params[:id])
    end

    def permitted_columns
      params.require(:event_category).permit(:title, :short_description, :long_description)
    end
end