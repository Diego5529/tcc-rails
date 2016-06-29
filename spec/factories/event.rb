FactoryGirl.define do
  factory :event do
    title { Faker::Name.title }
    short_description { Faker::Lorem.paragraph }
    long_description { Faker::Lorem.paragraph }
    address { Faker::Address.street_name }
    address_complement { Faker::Address.secondary_address }
    number { Faker::Address.building_number }
    district { Faker::Address.city }
    zip_code { Faker::Address.zip_code }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    url_site { Faker::Internet.url }
    facebook_page { Faker::Internet.url('facebook.com') }
    initial_date { Faker::Date.between(1.days.ago, Date.today) }
    end_date { Faker::Date.between(2.days.ago, Date.today) }
    initial_hour { Faker::Time.forward(23, :morning) }
    end_hour { Faker::Time.forward(23, :night) }
    status { Faker::Lorem.word }
    note { Faker::Lorem.sentence }
    archive { Faker::Boolean.boolean }
    use_password { Faker::Boolean.boolean }
    password { Faker::Internet.password(6, 20) }
    confirm_password { Faker::Internet.password(6, 20) }
    min_users { Faker::Number.number(5) }
    max_users { Faker::Number.number(10) }
  end
end