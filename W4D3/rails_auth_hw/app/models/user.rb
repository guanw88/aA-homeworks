class User < ApplicationRecord
  # Validate the presence of username and session_token
  validates :username, :session_token, presence: true, uniqueness: true

  # Validate the presence of password_digest and set the error message to Password can't be blank
  validates :password_digest, presence: { message: "Password can't be blank" }

  # Validate the length of password, and set allow_nil to true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  # Make sure that ensure_session_token gets called before_validation
  before_validation :ensure_session_token

  attr_reader :password

  # This method takes in a username and a password and returns the user that matches
  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    (user && BCrypt::Password.new(user.password_digest).is_password?(password)) ? user : nil
  end

  # This is a helper method I like to write that uses SecureRandom::urlsafe_base64
  # and returns a 16-digit pseudorandom string
  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  # This method resets the user's session_token and saves the user
  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  # This method makes sure that the user has a session_token set, setting one if none exists
  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  # This method sets @password equal to the argument given so that the appropriate validation can happen
  # This method also encrypts the argument given and saves it as this user's password_digest
  # Remember: you have to add an attr_reader for password for the validation to occur!
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end


end
