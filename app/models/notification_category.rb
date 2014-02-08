class NotificationCategory < ActiveRecord::Base
	has_many :preference, dependent: :destroy
end
