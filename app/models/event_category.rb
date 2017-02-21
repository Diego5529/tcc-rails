class EventCategory < ActiveRecord::Base
  #validations
  validates :title, :short_description, presence:true

  #associations
  has_many :event
end