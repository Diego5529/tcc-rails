class Admin::InvitationTypesController < Admin::AdminsController
  before_action :set_admin_invitation_type, only: [:show, :edit, :update, :destroy]

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
  end

  def update
    @invitation_type.update_attributes(permitted_columns)

    redirect_to admin_invitation_types_path
  end

  def show
  end

  def destroy
    if @invitation_type.destroy
      flash[:notice] = 'Delete success'
    else
      flash[:notice] = 'Delete error'
    end
    redirect_to admin_invitation_types_path
  end

  private
    def set_admin_invitation_type
      @invitation_type = InvitationType.find(params[:id])
    end

    def permitted_columns
      params.require(:invitation_type).permit(:title, :short_description, :long_description)
    end
end