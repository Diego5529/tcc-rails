class Admin::InvitationsController < Admin::AdminsController
  before_action :set_admin_invitation, only: [:show, :edit, :update, :destroy]

  def index
    @invitations = Invitation.all
  end

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.create(permitted_columns)

    if @invitation.errors.any?
      render :new
    else
      redirect_to admin_invitations_path
    end
  end

  def edit
  end

  def update
    @invitation.update_attributes(permitted_columns)

    redirect_to admin_invitations_path
  end

  def show
  end

  def destroy
    if @invitation.destroy
      flash[:notice] = 'Delete success'
    else
      flash[:notice] = 'Delete error'
    end
    redirect_to admin_invitations_path
  end

  private
    def set_admin_invitation
      @invitation = Invitation.find(params[:id])
    end

    def permitted_columns
      params.require(:invitation).permit(:event_id, :guest_user_id, :invitation_type_id, :host_user_id)
    end
end