require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:short_description) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:number) }
    it { is_expected.to validate_presence_of(:district) }
    it { is_expected.to validate_presence_of(:zip_code) }
    it { is_expected.to validate_presence_of(:initial_date) }
    it { is_expected.to validate_presence_of(:end_date) }
    it { is_expected.to validate_presence_of(:initial_hour) }
    it { is_expected.to validate_presence_of(:end_hour) }
  end

  context 'associations' do
    it { is_expected.to belong_to :city }
    it { is_expected.to belong_to :company }
    it { is_expected.to belong_to :event_category }
    it { is_expected.to belong_to :event_type }
    it { is_expected.to have_many :invitations }
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

    it 'without short_description' do
      event = FactoryGirl.build(:event, short_description: nil)
      event.valid?
      expect(event.errors[:short_description]).to include("can't be blank")
    end

    it 'without address' do
      event = FactoryGirl.build(:event, address: nil)
      event.valid?
      expect(event.errors[:address]).to include("can't be blank")
    end

    it 'without number' do
      event = FactoryGirl.build(:event, number: nil)
      event.valid?
      expect(event.errors[:number]).to include("can't be blank")
    end

    it 'without district' do
      event = FactoryGirl.build(:event, district: nil)
      event.valid?
      expect(event.errors[:district]).to include("can't be blank")
    end

    it 'without zip_code' do
      event = FactoryGirl.build(:event, zip_code: nil)
      event.valid?
      expect(event.errors[:zip_code]).to include("can't be blank")
    end

    it 'without initial_date' do
      event = FactoryGirl.build(:event, initial_date: nil)
      event.valid?
      expect(event.errors[:initial_date]).to include("can't be blank")
    end

    it 'without end_date' do
      event = FactoryGirl.build(:event, end_date: nil)
      event.valid?
      expect(event.errors[:end_date]).to include("can't be blank")
    end

    it 'without initial_hour' do
      event = FactoryGirl.build(:event, initial_hour: nil)
      event.valid?
      expect(event.errors[:initial_hour]).to include("can't be blank")
    end

    it 'without end_hour' do
      event = FactoryGirl.build(:event, end_hour: nil)
      event.valid?
      expect(event.errors[:end_hour]).to include("can't be blank")
    end
  end
end