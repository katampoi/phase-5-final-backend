class Profile < ApplicationRecord
    belongs_to :user
    validates :bio, length:{minimum:10}
end
