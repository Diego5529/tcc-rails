class Country < ActiveRecord::Base
  #validations
  validates :name, :initials, presence:true

  #associations
  has_many :states

  def created_at
    self[:created_at].strftime("%Y-%m-%d %H:%M:%S")
  end

  def updated_at
    self[:updated_at].strftime("%Y-%m-%d %H:%M:%S")
  end
end