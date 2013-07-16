class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  has_secure_password
  ROLES = %w[admin moderator author banned]
end
