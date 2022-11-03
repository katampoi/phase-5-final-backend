require "rails_helper"

RSpec.describe Review, type: :model do

    u1 = User.create(
        username:Faker::Internet.username,
        email:Faker::Internet.email,
        password: "dav@1231",
        password_confirmation: "dav@1231",
        first_name:Faker::Name.first_name ,
        last_name: Faker::Name.last_name,
        user_type: "admin"
      )

      c1 = Category.create(
        subscribe: false, 
        category_name: "DevOPs",
      )

    p1 = Post.create(
        title: "Easiest way to learn on Javascript!",
        media_vid: "https://www.youtube.com/watch?v=NOiT7mZjPXw",
        content:"Introduction to javascript is made easier. Learn this language in less than an hour!",
        user_id:u1.id,
        category_id:c1.id,
        like: 5,
        dislike: 2
    
    )

    let!(:review) do
        Review.create(
            user_id:u1.id, 
            post_id:p1.id, 
            like:1, 
            dislike: 3,
            comment: "I didn't quit understand what the blog meant. Too many words."
        )
    end

    describe '#id' do
        it 'it has an id' do
            expect(review.id).not_to eq(nil)
        end
    end

    describe '#user_id' do
        it 'returns user_id' do
            expect(review.user_id).to eq(u1.id)
        end
    end

    describe '#post_id' do
        it 'returns post_id' do
            expect(review.post_id).to eq(p1.id)
        end
    end

    describe "#like" do
        it 'returns review\s like' do
            expect(review.like).to eq(1)
        end
    end

    describe "#dislike" do
        it 'returns review\s dislike' do
            expect(review.dislike).to eq(3)
        end
    end

    describe "#comment" do
        it 'returns review\s comment' do
            expect(review.comment).to eq("I didn't quit understand what the blog meant. Too many words.")
        end
    end

end