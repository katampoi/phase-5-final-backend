class PostSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :title, :category_id, :media_img, :media_vid, :content, :like, :dislike
  has_many :reviews
end
