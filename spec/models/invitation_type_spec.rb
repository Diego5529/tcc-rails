require 'rails_helper'

RSpec.describe InvitationType, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:short_description) }
    it { is_expected.to validate_presence_of(:long_description) }
  end

  context 'associations' do
    it { is_expected.to have_many :invitation }
  end

  context "is valid" do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:invitation_type)).to be_valid
    end
  end

  context "is invalid" do
    it 'without title' do
      invitation_type = FactoryGirl.build(:invitation_type, title: nil)
      invitation_type.valid?
      expect(invitation_type.errors[:title]).to include("can't be blank")
    end

    it 'without short_description' do
      invitation_type = FactoryGirl.build(:invitation_type, short_description: nil)
      invitation_type.valid?
      expect(invitation_type.errors[:short_description]).to include("can't be blank")
    end

    it 'without long_description' do
      invitation_type = FactoryGirl.build(:invitation_type, long_description: nil)
      invitation_type.valid?
      expect(invitation_type.errors[:long_description]).to include("can't be blank")
    end
  end
end