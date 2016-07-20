class Country < ActiveRecord::Base
  #validations
  validates :name, :initials, presence:true

  #associations
  has_many :states

  def name_with_initials
    "#{name} - #{initials}"
  end
end