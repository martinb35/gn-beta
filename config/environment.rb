# Load the rails application.
require File.expand_path('../application', __FILE__)

# Initialize the rails application.
GoninisB1::Application.initialize!

# Use GMAIL as external SMTP

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :user_name => ENV['SENDGRID_USERNAME'],
  :password => ENV['SENDGRID_PASSWORD'],
  :domain => 'goninis.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
