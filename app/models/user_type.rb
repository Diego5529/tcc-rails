class UserType < ActiveRecord::Base
  #validations
  validates :title, :short_description, presence:true

  #associations
  has_many :user_company_types

  def created_at
    self[:created_at].strftime("%Y-%m-%d %H:%M:%S")
  end

  def updated_at
    self[:updated_at].strftime("%Y-%m-%d %H:%M:%S")
  end
end