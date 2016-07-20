class City < ActiveRecord::Base
  #validations
  validates :name, :state_id, presence:true

  #association
  belongs_to :state
  has_many :events
end