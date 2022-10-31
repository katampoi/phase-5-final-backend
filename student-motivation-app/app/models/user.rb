class User < ApplicationRecord
    enum user_type:{student:0, staff:1, admin:2}
    has_one :wishlist
    has_one :profile
    has_many :subscriptions
    has_many :reviews
    has_many :posts, through: :reviews
    has_secure_password

    validates :username, uniqueness: true
end
