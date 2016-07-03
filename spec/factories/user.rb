FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    last_name { Faker::Name.last_name }
    long_name { Faker::Name.last_name }
    birth_date { Faker::Time.between(DateTime.now - 1, DateTime.now) }
    genre { Faker::Book.genre }
    phone_number { Faker::PhoneNumber.phone_number }
    encrypted_password { Faker::Internet.password }
    reset_password_token { Faker::Internet.password }
    reset_password_sent_at { Faker::Time.between(DateTime.now - 1, DateTime.now) }
    password { Faker::Internet.password }
  end
end