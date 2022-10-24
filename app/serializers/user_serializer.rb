class UserSerializer < ActiveModel::Serializer
  attributes :id, :userName, :email, :user_type, :password_digest, :firstName, :lastName
end
