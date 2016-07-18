class Admin::CountriesController < Admin::AdminsController
  def index
    @countries = Country.all
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.create(permitted_columns)

    if @country.errors.any?
      render :new
    else
      redirect_to admin_countries_path
    end
  end

  def edit
    find_params
  end

  def update
    find_params
    @country.update_attributes(permitted_columns)

    redirect_to admin_countries_path
  end

  def show
    find_params
  end

  def destroy
    find_params
    if @country.destroy
      flash[:notice] = 'Delete success'
    else
      flash[:notice] = 'Delete error'
    end
    redirect_to admin_countries_path
  end

  private
    def permitted_columns
      params.require(:country).permit(:name, :initials)
    end

    def find_params
      @country = Country.find(params[:id])
    end
end