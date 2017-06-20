class City < ActiveRecord::Base
  #validations
  validates :name, :state_id, presence:true

  #association
  belongs_to :state
  has_many :events

  def created_at
    self[:created_at].strftime("%Y-%m-%d %H:%M:%S")
  end

  def updated_at
    self[:updated_at].strftime("%Y-%m-%d %H:%M:%S")
  end
end