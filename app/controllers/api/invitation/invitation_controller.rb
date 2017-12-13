class Api::Invitation::InvitationController < ApplicationController

  def index
    invitations = Invitation.all
    render json: { invitations: invitations }
  end

  def show
    invitation = Invitation.find(params[:id])
    render json: { invitation: invitation }
  end

  def update
    @invitation = Invitation.find_by_id(params[:invitation][:id])

    puts "===", @invitation.host_user_id, "==="

    if @invitation.user_id == 0
      user = User.find_by_email(@invitation.email)
      if user
        @invitation.user_id = user_id.id
      end
    end

    invitation = @invitation.update(update_params)
    if invitation
      UserMailer.welcome_email(@user, @invitation.email).deliver_later
      head :ok
    else
      render json: invitation.errors.full_messages, status: :unprocessable_entity
    end
  end

  def create
    @invitation = Invitation.new(create_params)

    puts "===", @invitation.host_user_id, "==="

    if @invitation.user_id == 0
      @user = User.find_by_email(@invitation.email)

      if @user != nil
        @invitation.user_id = @user.id
      end
    end

    if @invitation.save
      UserMailer.welcome_email(@user, @invitation.email).deliver_now
      render json: @invitation, status: :created, root: :invitation
    else
      render json: @invitation.errors.full_messages
    end
  end

  private
  def create_params
    params.require(:invitation).permit(:email, :event_id, :user_id, :host_user_id, :invitation_type_id)
  end

  def update_params
    params.require(:invitation).permit(:email, :event_id, :user_id, :host_user_id, :invitation_type_id)
  end
end