require "rails_helper"

RSpec.describe Profile, type: :model do
  it "can be created with valid data" do
    user = User.create(username: "kula moto", password: "kimoda", email: "test@example.com")
    profile = Profile.new(
      user_id: user.id,
      bio: "I am part of the moringa school staff, working as a Technical mentor",
      profile_pic:""
    )
    expect(profile).to be_valid
  end
  
  
  describe "validations" do
    it { is_expected.to validate_length_of(:bio).is_at_least(10) }
  end
end