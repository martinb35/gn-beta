class Preference < ActiveRecord::Base
  belongs_to :user
  belongs_to :notification_category
end
