class Admin::CitiesController < Admin::AdminsController
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
    find_params
  end

  def update
    find_params
    @city.update_attributes(permitted_columns)

    redirect_to admin_cities_path
  end

  def show
    find_params
  end

  def destroy
    find_params
    if @city.destroy
      flash[:notice] = 'Delete success'
    else
      flash[:notice] = 'Delete error'
    end
    redirect_to admin_cities_path
  end

  private
    def permitted_columns
      params.require(:city).permit(:name, :state_id)
    end

    def find_params
      @city = City.find(params[:id])
    end
end