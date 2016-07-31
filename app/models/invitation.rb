class Invitation < ActiveRecord::Base
  #validations
  validates :event_id, :guest_user_id, :invitation_type_id, :host_user_id, presence:true

  #associations
  belongs_to :event
  belongs_to :invitation_type
  belongs_to :user
end