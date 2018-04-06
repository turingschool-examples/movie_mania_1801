#
class User < ApplicationRecord
  has_secure_password

  validates_presence_of   :username
  validates_uniqueness_of :username

  enum role: [:default, :admin]
end
