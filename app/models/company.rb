class Company < ActiveRecord::Base
  #validations
  validates :title, :description, :min_users, :max_users, presence:true

  #associations
  has_many :events
  has_many :user_company_types
end