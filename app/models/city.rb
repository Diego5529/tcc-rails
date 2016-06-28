class City < ActiveRecord::Base
  #validations
  validates :name, :zip_code, :ddd, presence:true

  #association
  belongs_to :state
  has_many :events
end