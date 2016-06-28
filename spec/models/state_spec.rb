require 'rails_helper'

RSpec.describe State, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:initials) }
  end

  context 'associations' do
    it { is_expected.to belong_to :country }
    it { is_expected.to have_many :cities }
  end

  context "is valid" do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:state)).to be_valid
    end
  end

  context "is invalid" do
    it 'without name' do
      state = FactoryGirl.build(:state, name: nil)
      state.valid?
      expect(state.errors[:name]).to include("can't be blank")
    end

    it 'without initials' do
      state = FactoryGirl.build(:state, initials: nil)
      state.valid?
      expect(state.errors[:initials]).to include("can't be blank")
    end
  end
end