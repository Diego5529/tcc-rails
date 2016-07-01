class UserCompanyType < ActiveRecord::Base
  #validations
  validates :user_id, :company_id, :user_type_id, :active, :admin, presence:true

  #associations
  belongs_to :user_type
  belongs_to :company
  belongs_to :user
end