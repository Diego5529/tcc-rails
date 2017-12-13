class InvitationSerializer < ActiveModel::Serializer
  attributes :id, :email, :event_id, :user_id, :host_user_id, :invitation_type_id
end
