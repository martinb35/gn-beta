class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  has_secure_password
  ROLES = %w[admin moderator author banned]
  has_many :addresses
  has_many :preference, dependent: :destroy

  has_attached_file :attach, :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
    :default_url => "/images/:style/missing.png",
    :url  => "/assets/demo/:id/:style/:basename.:extension"

  #validates_attachment_presence :attach
  validates_attachment_size :attach, :less_than => 5.megabytes
  validates_attachment_content_type :attach, :content_type => /\Aimage\/.*\Z/
end
