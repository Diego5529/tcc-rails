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

  def initial_date
    self[:initial_date].strftime("%Y-%m-%d")
  end

  def end_date
    self[:end_date].strftime("%Y-%m-%d")
  end

  def initial_hour
    self[:initial_hour].strftime("%H:%M:%S")
  end

  def end_hour
    self[:end_hour].strftime("%H:%M:%S")
  end
end