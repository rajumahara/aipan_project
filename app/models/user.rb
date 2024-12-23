class User < ApplicationRecord
  MINIMUM_PASSWORD_LENGTH = 8
  has_secure_password
  has_many :sessions, dependent: :destroy

  validates :password, length: { minimum: MINIMUM_PASSWORD_LENGTH }, if: :password_digest_changed?
  validates :email, presence: true, uniqueness: true

  normalizes :email, with: ->(email) { email.strip.downcase }

  generate_token_for :password_reset, expires_in: 1.hour do
    password_salt.last(10)
  end
end