class Admin::UserTypesController < Admin::AdminsController
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
    find_params
  end

  def update
    find_params
    @user_type.update_attributes(permitted_columns)

    redirect_to admin_user_types_path
  end

  def show
    find_params
  end

  def destroy
    find_params
    if @user_type.destroy
      flash[:notice] = 'Delete success'
    else
      flash[:notice] = 'Delete error'
    end
    redirect_to admin_user_types_path
  end

  private
    def permitted_columns
      params.require(:user_type).permit(:title, :short_description, :long_description)
    end

    def find_params
      @user_type = UserType.find(params[:id])
    end
end