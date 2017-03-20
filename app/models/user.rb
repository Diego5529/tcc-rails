class User < ActiveRecord::Base
  include TokenGenerator

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  before_validation :generate_token

  #associations
  has_many :invitation
  has_many :user_company_types
  
  #validates
  validates :name, :email, presence: true

  validates_uniqueness_of :name, :email

  def self.from_omniauth(auth)
    random_password = SecureRandom.hex(20)

    create_with(email: auth[:email],
      password: random_password,
      password_confirmation: random_password,
      name: auth[:name],
    ).find_or_initialize_by(provider: auth[:provider], uid: auth[:uid])
  end
end