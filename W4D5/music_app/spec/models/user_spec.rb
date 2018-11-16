require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) {User.new(
                    email: "test@test.com",
                    password: "password"
                  )}

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe "#is_password?" do
    it "should return true when a correct password is entered" do
      expect(user.is_password?("password")).to be true
    end
    it "should return false when an incorrect password is submitted" do
      expect(user.is_password?("wordpass")).to be false
    end
  end

  describe "#reset_session_token" do
    it "should generate a new session token" do
      original_session_token = user.session_token
      user.reset_session_token!
      expect(user.session_token).to_not eq(original_session_token)
    end
  end

  describe "::find_by_credentials" do
    before {user.save}

    it "should find a matching user" do
      expect(User.find_by_credentials("test@test.com", "password")).to eq(user)
    end
    it "should return nil if no matching user found" do
      expect(User.find_by_credentials("nomatch@test.com", "wordpass")).to_not eq(user)
    end
    it "should return nil if email or password do not match" do
      expect(User.find_by_credentials("test@test.com", "wordpass")).to_not eq(user)
      expect(User.find_by_credentials("nomatch@test.com", "password")).to_not eq(user)
    end
  end

end
