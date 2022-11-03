require 'rails_helper'

RSpec.describe Post, type: :model do
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


  let!(:post) do 
       Post.create(
      title: "Easiest way to learn on Javascript!",
      media_vid: "https://www.youtube.com/watch?v=NOiT7mZjPXw",
      content:"Introduction to javascript is made easier. Learn this language in less than an hour!",
      user_id:u1.id,
      category_id:c1.id
    )
  end

  describe '#id' do
    
    it 'has an id' do
      expect(post.id).not_to eq(nil)
    end
  end

  describe '#title' do
    it 'returns the post\'s title' do
      expect(post.title).to eq('Easiest way to learn on Javascript!')
    end
  end
  
  describe '#media' do
    it 'returns the post\'s media' do
      expect(post.media_vid).to eq('https://www.youtube.com/watch?v=NOiT7mZjPXw')
    end
  end

  describe '#content' do
    it 'returns the post\'s content' do
      expect(post.content).to eq('Introduction to javascript is made easier. Learn this language in less than an hour!')
    end
  end

  describe '#user_id' do
    it 'returns the post\'s user_id' do
      expect(post.user_id).to eq(u1.id)
    end
  end

  describe '#category_id' do
    it 'returns the post\'s category_id' do
      expect(post.category_id).to eq(c1.id)
    end
  end
  

end
