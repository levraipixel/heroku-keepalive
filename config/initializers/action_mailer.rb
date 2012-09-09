ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => ENV["GMAIL_DOMAIN"],
  :authentication       => 'plain',
  :enable_starttls_auto => true,
  :user_name            => ENV["GMAIL_USERNAME"],
  :password             => ENV["GMAIL_PASSWORD"]
}
