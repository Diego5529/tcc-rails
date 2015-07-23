json.array!(@events) do |event|
  json.extract! event, :id, :name, :description, :place, :adress, :zip_code
  json.url event_url(event, format: :json)
end
