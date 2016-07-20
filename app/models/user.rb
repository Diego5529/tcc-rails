class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  #validates :name, :email, :last_name, :long_name, :birth_date, :genre, :phone_number, presence:true
  #validates_presence_of :name

  #associations
  has_many :invitation
  has_many :user_company_types
end