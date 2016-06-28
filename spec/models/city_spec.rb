require 'rails_helper'

RSpec.describe City, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:zip_code) }
    it { is_expected.to validate_presence_of(:ddd) }
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

    it 'without zip_code' do
      city = FactoryGirl.build(:city, zip_code: nil)
      city.valid?
      expect(city.errors[:zip_code]).to include("can't be blank")
    end

    it 'without ddd' do
      city = FactoryGirl.build(:city, ddd: nil)
      city.valid?
      expect(city.errors[:ddd]).to include("can't be blank")
    end
  end
end