class Invitation < ActiveRecord::Base
  #validations
  validates :event_id, :user_id, :invitation_type_id, :host_user_id, presence:true

  #associations
  belongs_to :event
  belongs_to :invitation_type
  belongs_to :user

  def created_at
    self[:created_at].strftime("%Y-%m-%d %H:%M:%S")
  end

  def updated_at
    self[:updated_at].strftime("%Y-%m-%d %H:%M:%S")
  end
end