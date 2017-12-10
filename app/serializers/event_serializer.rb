class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :short_description, :long_description, :initial_date, :end_date, :initial_hour, :end_hour, :min_users, :max_users, :company_id
end