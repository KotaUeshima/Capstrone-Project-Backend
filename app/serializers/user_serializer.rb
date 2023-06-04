class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :firstName, :lastName
end
