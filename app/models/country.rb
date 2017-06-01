class Country < ActiveRecord::Base
  #validations
  validates :name, :initials, presence:true

  #associations
  has_many :states
end