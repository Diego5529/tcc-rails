class Invitation < ActiveRecord::Base
  #validations
  validates :event_id, :user_id, :invitation_type_id, :guest_user, presence:true

  #associations
  belongs_to :invitation_type
end