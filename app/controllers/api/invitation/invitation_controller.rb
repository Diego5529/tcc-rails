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
    puts '===+====', params[:id], '===-====='
    invitation = Invitation.update(update_params)
    if invitation
      head :ok
    else
      render json: invitation.errors.full_messages, status: :unprocessable_entity
    end
  end

  def create
    puts '=======', params[:title], '========'
    @invitation = Invitation.new(create_params)
    if @invitation.save
      render json: @invitation, status: :created, root: :invitation
    else
      render json: @invitation.errors.full_messages
    end
  end

  private
  def create_params
    params.require(:invitation).permit(:email, :event_id, :user_id, :host_user_id, :invitation_id, :invitation_type_id)
  end

  def update_params
    params.require(:invitation).permit(:email, :event_id, :user_id, :host_user_id, :invitation_id, :invitation_type_id)
  end
end