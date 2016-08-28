class UserSerializer < ActiveModel::Serializer
  attributes :name, :email, :token
end