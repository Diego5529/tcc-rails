FactoryGirl.define do
  factory :user_company_type do
    user_id 1
    company_id 1
    user_type_id 1
    admin { Faker::Boolean.boolean }
    active { Faker::Boolean.boolean }
  end
end