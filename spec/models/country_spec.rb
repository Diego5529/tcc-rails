require 'rails_helper'

RSpec.describe Country, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:initials) }
  end

  context 'associations' do
    it { is_expected.to have_many :states }
  end

  context "is valid" do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:country)).to be_valid
    end
  end

  context "is invalid" do
    it 'without name' do
      country = FactoryGirl.build(:country, name: nil)
      country.valid?
      expect(country.errors[:name]).to include("can't be blank")
    end

    it 'without initials' do
      country = FactoryGirl.build(:country, initials: nil)
      country.valid?
      expect(country.errors[:initials]).to include("can't be blank")
    end
  end
end