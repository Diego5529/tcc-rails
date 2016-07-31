FactoryGirl.define do
  factory :admin_event, class: 'Admin::Event' do
    title "MyString"
    short_description "MyString"
    long_description "MyText"
    city_id 1
    address "MyString"
    address_complement "MyString"
    number "MyString"
    district "MyString"
    zip_code "MyString"
    latitude 1.5
    longitude 1.5
    url_site "MyString"
    facebook_page "MyString"
    initial_date "2016-07-24"
    end_date "2016-07-24"
    initial_hour "2016-07-24 18:27:21"
    end_hour "2016-07-24 18:27:21"
    status "MyString"
    note "MyText"
    archive false
    event_type_id 1
    event_category_id 1
    use_password false
    password "MyString"
    confirm_password "MyString"
    min_users 1
    max_users 1
    company_id 1
  end
end
