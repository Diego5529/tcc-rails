FactoryGirl.define do
  factory :invitation_type do
    title { Faker::Name.title }
    short_description { Faker::Lorem.paragraph }
    long_description { Faker::Lorem.paragraph }
  end
end