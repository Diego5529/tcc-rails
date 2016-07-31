json.array!(@admin_events) do |admin_event|
  json.extract! admin_event, :id, :title, :short_description, :long_description, :city_id, :address, :address_complement, :number, :district, :zip_code, :latitude, :longitude, :url_site, :facebook_page, :initial_date, :end_date, :initial_hour, :end_hour, :status, :note, :archive, :event_type_id, :event_category_id, :use_password, :password, :confirm_password, :min_users, :max_users, :company_id
  json.url admin_event_url(admin_event, format: :json)
end
