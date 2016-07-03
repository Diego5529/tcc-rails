FactoryGirl.define do
  factory :country do
    name { Faker::Name.name }
    initials { Faker::Address.country_code }
  end
end