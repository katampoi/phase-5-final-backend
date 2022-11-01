class UserSerializers < ActiveModel::Serializer
  attributes :id, :username, :email, :user_type,  :first_name, :last_name
end
