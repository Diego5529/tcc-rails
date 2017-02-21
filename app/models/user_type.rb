class UserType < ActiveRecord::Base
  #validations
  validates :title, :short_description, presence:true

  #associations
  has_many :user_company_types
end