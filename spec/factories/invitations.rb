FactoryGirl.define do
  factory :invitation do
    event_id 1
    guest_user_id 1
    invitation_type_id 1
    host_user_id 2
  end
end