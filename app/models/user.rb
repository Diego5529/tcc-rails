class User < ActiveRecord::Base
  include TokenGenerator

  devise :database_authenticatable, :registerable, :recoverable, :trackable, :validatable

  before_validation :generate_token

  #associations
  has_many :invitation
  has_many :user_company_types

  validates :name, presence: true

  def self.from_omniauth(auth)
    random_password = SecureRandom.hex(20)

    create_with(email: auth[:email],
      password: random_password,
      password_confirmation: random_password,
      name: auth[:name],
    ).find_or_initialize_by(provider: auth[:provider], uid: auth[:uid])
  end
end