require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:long_name) }
    it { is_expected.to validate_presence_of(:birth_date) }
    it { is_expected.to validate_presence_of(:genre) }
    it { is_expected.to validate_presence_of(:phone_number) }
  end

  context 'associations' do
    it { is_expected.to have_many :invitation }
    it { is_expected.to have_many :user_company_types }
  end

  context "is valid" do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:user)).to be_valid
    end
  end

  context "is invalid" do
    it 'without name' do
      user = FactoryGirl.build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'without email' do
      user = FactoryGirl.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'without last_name' do
      user = FactoryGirl.build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it 'without long_name' do
      user = FactoryGirl.build(:user, long_name: nil)
      user.valid?
      expect(user.errors[:long_name]).to include("can't be blank")
    end

    it 'without birth_date' do
      user = FactoryGirl.build(:user, birth_date: nil)
      user.valid?
      expect(user.errors[:birth_date]).to include("can't be blank")
    end

    it 'without genre' do
      user = FactoryGirl.build(:user, genre: nil)
      user.valid?
      expect(user.errors[:genre]).to include("can't be blank")
    end

    it 'without phone_number' do
      user = FactoryGirl.build(:user, phone_number: nil)
      user.valid?
      expect(user.errors[:phone_number]).to include("can't be blank")
    end
  end
end