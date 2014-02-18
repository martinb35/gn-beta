class Demo < ActiveRecord::Base
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
    :default_url => "/images/:style/missing.png",
    :url  => "/assets/demo/:id/:style/:basename.:extension"

  validates_attachment_presence :avatar
  validates_attachment_size :avatar, :less_than => 5.megabytes
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end
