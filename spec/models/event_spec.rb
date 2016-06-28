require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:title) }
  end

  context 'associations' do
    it { is_expected.to belong_to :city }
  end

  context "is valid" do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:event)).to be_valid
    end
  end

  context "is invalid" do
    it 'without title' do
      event = FactoryGirl.build(:event, title: nil)
      event.valid?
      expect(event.errors[:title]).to include("can't be blank")
    end
  end
end