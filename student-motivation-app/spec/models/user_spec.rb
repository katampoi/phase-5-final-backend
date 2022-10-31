require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a password field' do
    expect(User.new).to respond_to(:password)
  end

  it 'has a username field' do
    expect(User.new).to respond_to(:username)
  end

  it "has many posts" do
    expect(User.new).to respond_to(:posts)
  end

  it 'has a password confirmation field' do
    expect(User.new).to respond_to(:password_confirmation)
  end

  it 'is valid if password and password_confirmation match' do
    user = User.new
    user.password = 'brejin'
    user.password_confirmation = 'brejin'
    expect(user.valid?).to be(true)
  end

  it 'is valid if password is set and password_confirmation is nil' do
     user = User.new
     user.password = 'matata'
     expect(user.valid?).to be(true)
  end

  it "is invalid if password and password_confirmation are both non-nil and don't match" do
    user = User.new
    user.password = 'kimoda'
    user.password_confirmation = 'Kimoda'
    expect(user.valid?).to be(false)
  end

  describe 'authenticate' do
    it 'returns the user if credentials match' do
      user = User.new
      user.password = 'wassup'
      expect(user.authenticate('wassup')).to eq(user)
    end

    it "returns false if credentials don't match" do
      user = User.new
      user.password = 'wagwan'
      expect(user.authenticate('yooh')).to be(false)
    end
  end

  describe "validations" do
    it { is_expected.to validate_uniqueness_of(:username) }
  end
end