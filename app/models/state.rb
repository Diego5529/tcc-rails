class State < ActiveRecord::Base
  #validates
  validates :name, :initials, :country_id, presence:true

  #associations
  belongs_to :country
  has_many :cities

  def name_with_initials
    "#{name} - #{initials}"
  end
end