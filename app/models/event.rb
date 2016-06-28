class Event < ActiveRecord::Base
  #validations
  validates :title, presence:true

  #associations
  belongs_to :city
end