class User < ApplicationRecord
    has_one :wishlist
    has_one :profile
    has_many :subscriptions
    has_many :reviews
    has_many :posts, through: :reviews
end
