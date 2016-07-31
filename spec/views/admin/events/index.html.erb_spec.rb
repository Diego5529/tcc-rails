require 'rails_helper'

RSpec.describe "admin/events/index", type: :view do
  before(:each) do
    assign(:admin_events, [
      Admin::Event.create!(
        :title => "Title",
        :short_description => "Short Description",
        :long_description => "MyText",
        :city_id => 2,
        :address => "Address",
        :address_complement => "Address Complement",
        :number => "Number",
        :district => "District",
        :zip_code => "Zip Code",
        :latitude => 3.5,
        :longitude => 4.5,
        :url_site => "Url Site",
        :facebook_page => "Facebook Page",
        :status => "Status",
        :note => "MyText",
        :archive => false,
        :event_type_id => 5,
        :event_category_id => 6,
        :use_password => false,
        :password => "Password",
        :confirm_password => "Confirm Password",
        :min_users => 7,
        :max_users => 8,
        :company_id => 9
      ),
      Admin::Event.create!(
        :title => "Title",
        :short_description => "Short Description",
        :long_description => "MyText",
        :city_id => 2,
        :address => "Address",
        :address_complement => "Address Complement",
        :number => "Number",
        :district => "District",
        :zip_code => "Zip Code",
        :latitude => 3.5,
        :longitude => 4.5,
        :url_site => "Url Site",
        :facebook_page => "Facebook Page",
        :status => "Status",
        :note => "MyText",
        :archive => false,
        :event_type_id => 5,
        :event_category_id => 6,
        :use_password => false,
        :password => "Password",
        :confirm_password => "Confirm Password",
        :min_users => 7,
        :max_users => 8,
        :company_id => 9
      )
    ])
  end

  it "renders a list of admin/events" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Short Description".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Address Complement".to_s, :count => 2
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    assert_select "tr>td", :text => "District".to_s, :count => 2
    assert_select "tr>td", :text => "Zip Code".to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => 4.5.to_s, :count => 2
    assert_select "tr>td", :text => "Url Site".to_s, :count => 2
    assert_select "tr>td", :text => "Facebook Page".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
    assert_select "tr>td", :text => "Confirm Password".to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => 8.to_s, :count => 2
    assert_select "tr>td", :text => 9.to_s, :count => 2
  end
end
