class JobCategory < ActiveRecord::Base
  has_many :jobs
  belongs_to :service
  validates :icon, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }
end
