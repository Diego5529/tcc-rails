require 'rails_helper'

RSpec.describe "admin/events/show", type: :view do
  before(:each) do
    @admin_event = assign(:admin_event, Admin::Event.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Short Description/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Address Complement/)
    expect(rendered).to match(/Number/)
    expect(rendered).to match(/District/)
    expect(rendered).to match(/Zip Code/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/4.5/)
    expect(rendered).to match(/Url Site/)
    expect(rendered).to match(/Facebook Page/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Password/)
    expect(rendered).to match(/Confirm Password/)
    expect(rendered).to match(/7/)
    expect(rendered).to match(/8/)
    expect(rendered).to match(/9/)
  end
end
