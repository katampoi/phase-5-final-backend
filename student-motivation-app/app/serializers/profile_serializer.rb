class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :profile_pic, :bio
end
