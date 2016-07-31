class Admin::UserTypesController < Admin::AdminsController
  before_action :set_admin_user_type, only: [:show, :edit, :update, :destroy]

  def index
    @user_types = UserType.all
  end

  def new
    @user_type = UserType.new
  end

  def create
    @user_type = UserType.create(permitted_columns)

    if @user_type.errors.any?
      render :new
    else
      redirect_to admin_user_types_path
    end
  end

  def edit
  end

  def update
    @user_type.update_attributes(permitted_columns)

    redirect_to admin_user_types_path
  end

  def show
  end

  def destroy
    if @user_type.destroy
      flash[:notice] = 'Delete success'
    else
      flash[:notice] = 'Delete error'
    end
    redirect_to admin_user_types_path
  end

  private
    def set_admin_user_type
      @user_type = UserType.find(params[:id])
    end

    def permitted_columns
      params.require(:user_type).permit(:title, :short_description, :long_description)
    end
end