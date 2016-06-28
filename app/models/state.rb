class State < ActiveRecord::Base
  #validates
  validates :name, :initials, presence:true

  #associations
  belongs_to :country
  has_many :cities
end