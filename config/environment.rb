# Load the rails application.
require File.expand_path('../application', __FILE__)

# Initialize the rails application.
GoninisB1::Application.initialize!

# Use GMAIL as external SMTP

ActionMailer::Base.smtp_settings = {
  :user_name => 'goninis',
  :password => 'iQK12VTGA',
  :domain => 'goninis.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
