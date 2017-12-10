class Event < ActiveRecord::Base
  #validations
  validates :title, :short_description, :initial_date, :end_date, :initial_hour, :end_hour, presence:true

  #associations
  belongs_to :city
  belongs_to :company
  belongs_to :event_category
  belongs_to :event_type
  has_many :invitations

  def created_at
    self[:created_at].strftime("%Y-%m-%d %H:%M:%S")
  end

  def updated_at
    self[:updated_at].strftime("%Y-%m-%d %H:%M:%S")
  end
end