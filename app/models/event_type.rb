class EventType < ActiveRecord::Base
  #validations
  validates :title, :short_description, presence:true

  #associations
  has_many :event

  def created_at
    self[:created_at].strftime("%Y-%m-%d %H:%M:%S")
  end

  def updated_at
    self[:updated_at].strftime("%Y-%m-%d %H:%M:%S")
  end
end