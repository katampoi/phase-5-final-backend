class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :profile_pic, :bio
  belongs_to :user
end
