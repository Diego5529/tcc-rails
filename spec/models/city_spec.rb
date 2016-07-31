require 'rails_helper'

RSpec.describe City, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:state_id) }
  end

  context 'associations' do
    it { is_expected.to belong_to :state }
    it { is_expected.to have_many :events }
  end

  context "is valid" do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:city)).to be_valid
    end
  end

  context "is invalid" do
    it 'without name' do
      city = FactoryGirl.build(:city, name: nil)
      city.valid?
      expect(city.errors[:name]).to include("can't be blank")
    end

    it 'without state_id' do
      city = FactoryGirl.build(:city, state_id: nil)
      city.valid?
      expect(city.errors[:state_id]).to include("can't be blank")
    end
  end
end