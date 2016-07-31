class Admin::CitiesController < Admin::AdminsController
  before_action :set_admin_city, only: [:show, :edit, :update, :destroy]

  def index
    @cities = City.all
  end

  def new
    @city = City.new
    @city.state_id = params[:format]
  end

  def create
    @city = City.create(permitted_columns)

    if @city.errors.any?
      render :new
    else
      redirect_to admin_cities_path
    end
  end

  def edit
  end

  def update
    @city.update_attributes(permitted_columns)

    redirect_to admin_cities_path
  end

  def show
  end

  def destroy
    if @city.destroy
      flash[:notice] = 'Delete success'
    else
      flash[:notice] = 'Delete error'
    end
    redirect_to admin_cities_path
  end

  private
    def set_admin_city
      @city = City.find(params[:id])
    end

    def permitted_columns
      params.require(:city).permit(:name, :state_id)
    end
end