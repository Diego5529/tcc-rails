class City < ActiveRecord::Base
  #validations
  validates :name, :state_id, presence:true

  #association
  belongs_to :state
  has_many :events
end

class State < ActiveRecord::Base
  #validates
  validates :name, :initials, :country_id, presence:true

  #associations
  belongs_to :country
  has_many :cities
end