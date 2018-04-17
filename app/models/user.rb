class User < ApplicationRecord
  validates :username, :password, presence: true
  has_secure_password
  enum role: %w(default admin)
end
