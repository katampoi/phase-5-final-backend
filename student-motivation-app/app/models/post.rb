class Post < ApplicationRecord
    belongs_to :user
    belongs_to :category
    # belongs_to :wishlist
    has_many :reviews
end
