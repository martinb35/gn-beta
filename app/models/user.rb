class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  has_secure_password
  ROLES = %w[admin moderator author banned]
  has_many :addresses
  has_many :preference, dependent: :destroy
end
