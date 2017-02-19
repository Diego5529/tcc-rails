class Admin::CompaniesController < Admin::AdminsController
  before_action :set_admin_company, only: [:show, :edit, :update, :destroy]

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.create(permitted_columns)

    if @company.errors.any?
      render :new
    else
      redirect_to admin_companies_path
    end
  end

  def edit
  end

  def update
    @company.update_attributes(permitted_columns)

    redirect_to admin_companies_path
  end

  def show
  end

  def destroy
    if @company.destroy
      flash[:notice] = 'Delete success'
    else
      flash[:notice] = 'Delete error'
    end
    redirect_to admin_companies_path
  end

  private
    def set_admin_company
      @company = Company.find(params[:id])
    end

    def permitted_columns
      params.require(:company).permit(:title, :description, :max_users, :min_users)
    end
end