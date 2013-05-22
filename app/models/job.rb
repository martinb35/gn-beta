class Job < ActiveRecord::Base
  belongs_to :job_category
  belongs_to :floors
  belongs_to :rooms
  belongs_to :bathrooms
  
  validates :when, presence: true
  validates :offer, numericality: {greater_than_or_equal_to: 20.0}
  validates :level, :floor, :room, :bathroom, numericality: {greater_than_or_equal_to: 1}
end
