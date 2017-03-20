class StateSerializer < ActiveModel::Serializer
  attributes :id, :name, :initials, :country_id
end
