class State < ActiveRecord::Base
  #validates
  validates :name, :initials, :country_id, presence:true

  #associations
  belongs_to :country
  has_many :cities

  def name_with_initials
    "#{name} - #{initials}"
  end

  def created_at
    self[:created_at].strftime("%Y-%m-%d %H:%M:%S")
  end

  def updated_at
    self[:updated_at].strftime("%Y-%m-%d %H:%M:%S")
  end
end