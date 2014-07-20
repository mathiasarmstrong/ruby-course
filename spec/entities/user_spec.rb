require 'spec_helper'

describe DoubleDog::User do
  let(:user){DoubleDog::User.new(nil, 'Dan', '123')}
  # This method should work whether or not we are storing passwords
  # in plain-text (BAD) or using a hashing library like bcrypt (good).
  describe '#has_password?' do
    it "returns false for an incorrect password" do
      result = user.has_password?('wrong password')
      expect(result).to eq false
    end

    it "returns true for a correct password" do
      result = user.has_password?('123')
      expect(result).to eq true
    end
  end

  describe '#admin?' do
    it "returns false if not an admin" do
      expect(user.admin?).to eq false
    end

    it "returns true if admin" do
      user1 = DoubleDog::User.new(nil, 'Earl', '333', true)
      expect(user1.admin?).to eq true
    end
  end
end
