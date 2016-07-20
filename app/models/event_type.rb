class EventType < ActiveRecord::Base
  #validations
  validates :title, :short_description, :long_description, presence:true

  #associations
  has_many :event
end