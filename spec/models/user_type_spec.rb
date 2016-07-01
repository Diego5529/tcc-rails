require 'rails_helper'

RSpec.describe UserType, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:short_description) }
    it { is_expected.to validate_presence_of(:long_description) }
  end

  context 'associations' do
    it { is_expected.to have_many :user_company_types }
  end

  context "is valid" do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:user_type)).to be_valid
    end
  end

  context "is invalid" do
    it 'without title' do
      user_type = FactoryGirl.build(:user_type, title: nil)
      user_type.valid?
      expect(user_type.errors[:title]).to include("can't be blank")
    end

    it 'without short_description' do
      user_type = FactoryGirl.build(:user_type, short_description: nil)
      user_type.valid?
      expect(user_type.errors[:short_description]).to include("can't be blank")
    end

    it 'without long_description' do
      user_type = FactoryGirl.build(:user_type, long_description: nil)
      user_type.valid?
      expect(user_type.errors[:long_description]).to include("can't be blank")
    end
  end
end