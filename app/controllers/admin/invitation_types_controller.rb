class Admin::InvitationTypesController < Admin::AdminsController
  def index
    @invitation_types = InvitationType.all
  end

  def new
    @invitation_type = InvitationType.new
  end

  def create
    @invitation_type = InvitationType.create(permitted_columns)

    if @invitation_type.errors.any?
      render :new
    else
      redirect_to admin_invitation_types_path
    end
  end

  def edit
    find_params
  end

  def update
    find_params
    @invitation_type.update_attributes(permitted_columns)

    redirect_to admin_invitation_types_path
  end

  def show
    find_params
  end

  def destroy
    find_params
    if @invitation_type.destroy
      flash[:notice] = 'Delete success'
    else
      flash[:notice] = 'Delete error'
    end
    redirect_to admin_invitation_types_path
  end

  private
    def permitted_columns
      params.require(:invitation_type).permit(:title, :short_description, :long_description)
    end

    def find_params
      @invitation_type = InvitationType.find(params[:id])
    end
end