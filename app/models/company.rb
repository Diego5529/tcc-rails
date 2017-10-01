class Company < ActiveRecord::Base
  #validations
  validates :title, :short_description, presence:true

  # validates_uniqueness_of :title

  attr_accessor :current_user

  #associations
  has_many :events
  has_many :user_company_types

  scope :unowned, -> (user) { includes(:user_company_types).where(user_company_types: { user_id: user.id, admin: true }) }

  # after_save do
  # 	userCT ||= UserCompanyType.new

  # 	userCT.user_id = current_user
  #   userCT.company_id = self.id
  #   userCT.user_type_id = 1
  #   userCT.active = true
  #   userCT.admin = true
  #   userCT.save
  # end

  def created_at
    self[:created_at].strftime("%Y-%m-%d %H:%M:%S")
  end

  def updated_at
    self[:updated_at].strftime("%Y-%m-%d %H:%M:%S")
  end
end