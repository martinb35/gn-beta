# Load the rails application.
require File.expand_path('../application', __FILE__)

# Initialize the rails application.
GoninisB1::Application.initialize!

# Use GMAIL as external SMTP

ActionMailer::Base.smtp_settings = {
  :user_name => 'smtp@semantic.mx',
  :password => 'semantic120',
  :domain => 'semantic.mx',
  :address => 'smtp.gmail.com',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
