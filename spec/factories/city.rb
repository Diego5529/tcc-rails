FactoryGirl.define do
  factory :city do
    name { Faker::Name.name }
    state_id 1
    #zip_code { Faker::Address.zip_code }
    #ddd { Faker::PhoneNumber.subscriber_number(2) }
  end
end