json.array!(@events) do |event|
  json.extract! event, :id, :name, :short_description, :long_description, :city, :state, :address, :number, :complement, :district, :zip_code, :initial_date, :end_date, :initial_hour, :end_hour, :status, :archived, :min_user, :max_user
  json.url event_url(event, format: :json)
end
