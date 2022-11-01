class PostSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :title, :category_id, :media_img, :media_vid, :content
end
