FactoryGirl.define do
  factory :user_type do
    title { Faker::Name.title }
    short_description { Faker::Lorem.paragraph }
    long_description { Faker::Lorem.paragraph }
  end
end