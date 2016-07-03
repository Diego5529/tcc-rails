require 'rails_helper'

RSpec.describe Company, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:min_users) }
    it { is_expected.to validate_presence_of(:max_users) }
  end

  context 'associations' do
    it { is_expected.to have_many :events }
    it { is_expected.to have_many :user_company_types }
  end

  context "is valid" do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:company)).to be_valid
    end
  end

  context "is invalid" do
    it 'without title' do
      company = FactoryGirl.build(:company, title: nil)
      company.valid?
      expect(company.errors[:title]).to include("can't be blank")
    end

    it 'without description' do
      company = FactoryGirl.build(:company, description: nil)
      company.valid?
      expect(company.errors[:description]).to include("can't be blank")
    end

    it 'without min_users' do
      company = FactoryGirl.build(:company, min_users: nil)
      company.valid?
      expect(company.errors[:min_users]).to include("can't be blank")
    end

    it 'without max_users' do
      company = FactoryGirl.build(:company, max_users: nil)
      company.valid?
      expect(company.errors[:max_users]).to include("can't be blank")
    end
  end
end