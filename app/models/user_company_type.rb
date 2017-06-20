class UserCompanyType < ActiveRecord::Base
  #validations
  validates :user_id, :company_id, :user_type_id, presence:true
  validates :active, :admin, inclusion: [true, false]

  #associations
  belongs_to :user_type
  belongs_to :company
  belongs_to :user

  scope :active, -> { where(active: true) }

  def full_description
  	u = User.find(user_id)
  	c = Company.find(company_id)
  	ut = UserType.find(user_type_id)

  	u.name + ' - ' + c.title + ' - ' + ut.title
  end

  def created_at
    self[:created_at].strftime("%Y-%m-%d %H:%M:%S")
  end

  def updated_at
    self[:updated_at].strftime("%Y-%m-%d %H:%M:%S")
  end
end