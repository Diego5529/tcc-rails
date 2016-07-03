class UserCompanyType < ActiveRecord::Base
  #validations
  validates :user_id, :company_id, :user_type_id, presence:true
  validates :active, :admin, :inclusion => [true, false]

  #associations
  belongs_to :user_type
  belongs_to :company
  belongs_to :user
end