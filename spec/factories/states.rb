FactoryGirl.define do
  factory :state do
    name { Faker::Name.name }
    initials { Faker::Address.state_abbr }
  end
end