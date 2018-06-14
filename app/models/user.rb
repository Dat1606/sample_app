class User < ApplicationRecord
  before_save {self.email = email.downcase}
  validates :name,  presence: true, length: {maximum: Settings.name.maximum}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  # Check whether email is valid or not? Email must be non-empty.
  # Length : not exceed 255, must be unique and be in correct email form .
  validates :email, presence: true, length: {maximum: Settings.email.maximum},
      format: {with: VALID_EMAIL_REGEX},
      uniqueness: {case_sensitive: false}

  has_secure_password
  validates :password, presence: true, length: {maximum: Settings.password.maximum}
end
