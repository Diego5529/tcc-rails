FactoryGirl.define do
  factory :event do
    title { Faker::Name.title }
  end
end