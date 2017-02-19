class Admin::UserCompanyTypesController < Admin::AdminsController
  before_action :set_admin_user_company_type, only: [:show, :edit, :update, :destroy]

  def index
    @user_company_types = UserCompanyType.all
  end

  def new
    @user_company_type = UserCompanyType.new
  end

  def create
    @user_company_type = UserCompanyType.create(permitted_columns)

    if @user_company_type.errors.any?
      render :new
    else
      redirect_to admin_user_company_types_path
    end
  end

  def edit
  end

  def update
    @user_company_type.update_attributes(permitted_columns)

    redirect_to admin_user_company_type_path
  end

  def show
  end

  def destroy
    if @user_company_type.destroy
      flash[:notice] = 'Delete success'
    else
      flash[:notice] = 'Delete error'
    end
    redirect_to admin_user_company_types_path
  end

  private
    def set_admin_user_company_type
      @user_company_type = UserCompanyType.find(params[:id])
    end

    def permitted_columns
      params.require(:user_company_type).permit(:user_id, :company_id, :user_type_id, :active, :admin)
    end
end