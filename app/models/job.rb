class Job < ActiveRecord::Base
  validates :title, presence: true
  validates :offer, numericality: {greater_than_or_equal_to: 0.01}
  validates :level, :floor, :room, :bathroom, numericality: {greater_than_or_equal_to: 1}
end
