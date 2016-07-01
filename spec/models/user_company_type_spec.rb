require 'rails_helper'

RSpec.describe UserCompanyType, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:company_id) }
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:user_type_id) }
    it { is_expected.to validate_presence_of(:active) }
    it { is_expected.to validate_presence_of(:admin) }
  end

  context 'associations' do
    it { is_expected.to belong_to :user_type }
    it { is_expected.to belong_to :company }
    it { is_expected.to belong_to :user }
  end

  context "is valid" do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:user_company_type)).to be_valid
    end
  end

  context "is invalid" do
    it 'without company_id' do
      user_company_type = FactoryGirl.build(:user_company_type, company_id: nil)
      user_company_type.valid?
      expect(user_company_type.errors[:company_id]).to include("can't be blank")
    end

    it 'without user_id' do
      user_company_type = FactoryGirl.build(:user_company_type, user_id: nil)
      user_company_type.valid?
      expect(user_company_type.errors[:user_id]).to include("can't be blank")
    end

    it 'without user_type_id' do
      user_company_type = FactoryGirl.build(:user_company_type, user_type_id: nil)
      user_company_type.valid?
      expect(user_company_type.errors[:user_type_id]).to include("can't be blank")
    end

    it 'without active' do
      user_company_type = FactoryGirl.build(:user_company_type, active: nil)
      user_company_type.valid?
      expect(user_company_type.errors[:active]).to include("can't be blank")
    end

    it 'without admin' do
      user_company_type = FactoryGirl.build(:user_company_type, admin: nil)
      user_company_type.valid?
      expect(user_company_type.errors[:admin]).to include("can't be blank")
    end
  end
end