require 'rails_helper'

RSpec.describe Invitation, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:event_id) }
    it { is_expected.to validate_presence_of(:guest_user_id) }
    it { is_expected.to validate_presence_of(:invitation_type_id) }
    it { is_expected.to validate_presence_of(:host_user_id) }
  end

  context 'associations' do
    it { is_expected.to belong_to :event }
    it { is_expected.to belong_to :invitation_type }
    it { is_expected.to belong_to :user }
  end

  context "is valid" do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:invitation)).to be_valid
    end
  end

  context "is invalid" do
    it 'without event_id' do
      invitation = FactoryGirl.build(:invitation, event_id: nil)
      invitation.valid?
      expect(invitation.errors[:event_id]).to include("can't be blank")
    end

    it 'without guest_user_id' do
      invitation = FactoryGirl.build(:invitation, guest_user_id: nil)
      invitation.valid?
      expect(invitation.errors[:guest_user_id]).to include("can't be blank")
    end

    it 'without invitation_type_id' do
      invitation = FactoryGirl.build(:invitation, invitation_type_id: nil)
      invitation.valid?
      expect(invitation.errors[:invitation_type_id]).to include("can't be blank")
    end

    it 'without host_user_id' do
      invitation = FactoryGirl.build(:invitation, host_user_id: nil)
      invitation.valid?
      expect(invitation.errors[:host_user_id]).to include("can't be blank")
    end
  end
end