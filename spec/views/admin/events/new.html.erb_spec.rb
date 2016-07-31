require 'rails_helper'

RSpec.describe "admin/events/new", type: :view do
  before(:each) do
    assign(:admin_event, Admin::Event.new(
      :title => "MyString",
      :short_description => "MyString",
      :long_description => "MyText",
      :city_id => 1,
      :address => "MyString",
      :address_complement => "MyString",
      :number => "MyString",
      :district => "MyString",
      :zip_code => "MyString",
      :latitude => 1.5,
      :longitude => 1.5,
      :url_site => "MyString",
      :facebook_page => "MyString",
      :status => "MyString",
      :note => "MyText",
      :archive => false,
      :event_type_id => 1,
      :event_category_id => 1,
      :use_password => false,
      :password => "MyString",
      :confirm_password => "MyString",
      :min_users => 1,
      :max_users => 1,
      :company_id => 1
    ))
  end

  it "renders new admin_event form" do
    render

    assert_select "form[action=?][method=?]", admin_events_path, "post" do

      assert_select "input#admin_event_title[name=?]", "admin_event[title]"

      assert_select "input#admin_event_short_description[name=?]", "admin_event[short_description]"

      assert_select "textarea#admin_event_long_description[name=?]", "admin_event[long_description]"

      assert_select "input#admin_event_city_id[name=?]", "admin_event[city_id]"

      assert_select "input#admin_event_address[name=?]", "admin_event[address]"

      assert_select "input#admin_event_address_complement[name=?]", "admin_event[address_complement]"

      assert_select "input#admin_event_number[name=?]", "admin_event[number]"

      assert_select "input#admin_event_district[name=?]", "admin_event[district]"

      assert_select "input#admin_event_zip_code[name=?]", "admin_event[zip_code]"

      assert_select "input#admin_event_latitude[name=?]", "admin_event[latitude]"

      assert_select "input#admin_event_longitude[name=?]", "admin_event[longitude]"

      assert_select "input#admin_event_url_site[name=?]", "admin_event[url_site]"

      assert_select "input#admin_event_facebook_page[name=?]", "admin_event[facebook_page]"

      assert_select "input#admin_event_status[name=?]", "admin_event[status]"

      assert_select "textarea#admin_event_note[name=?]", "admin_event[note]"

      assert_select "input#admin_event_archive[name=?]", "admin_event[archive]"

      assert_select "input#admin_event_event_type_id[name=?]", "admin_event[event_type_id]"

      assert_select "input#admin_event_event_category_id[name=?]", "admin_event[event_category_id]"

      assert_select "input#admin_event_use_password[name=?]", "admin_event[use_password]"

      assert_select "input#admin_event_password[name=?]", "admin_event[password]"

      assert_select "input#admin_event_confirm_password[name=?]", "admin_event[confirm_password]"

      assert_select "input#admin_event_min_users[name=?]", "admin_event[min_users]"

      assert_select "input#admin_event_max_users[name=?]", "admin_event[max_users]"

      assert_select "input#admin_event_company_id[name=?]", "admin_event[company_id]"
    end
  end
end
