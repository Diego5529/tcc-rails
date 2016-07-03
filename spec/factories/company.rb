FactoryGirl.define do
  factory :company do
    title { Faker::Name.title }
    description { Faker::Lorem.paragraph }
    min_users { Faker::Number.number(5) }
    max_users { Faker::Number.number(10) }
  end
end