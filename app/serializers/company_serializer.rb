class CompanySerializer < ActiveModel::Serializer
  attributes :id, :title, :short_description, :long_description
end