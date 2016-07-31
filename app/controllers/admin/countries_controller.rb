class Admin::CountriesController < Admin::AdminsController
  before_action :set_admin_country, only: [:show, :edit, :update, :destroy]

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
  end

  def update
    @country.update_attributes(permitted_columns)

    redirect_to admin_countries_path
  end

  def show
  end

  def destroy
    if @country.destroy
      flash[:notice] = 'Delete success'
    else
      flash[:notice] = 'Delete error'
    end
    redirect_to admin_countries_path
  end

  private
    def set_admin_country
      @country = Country.find(params[:id])
    end

    def permitted_columns
      params.require(:country).permit(:name, :initials)
    end
end