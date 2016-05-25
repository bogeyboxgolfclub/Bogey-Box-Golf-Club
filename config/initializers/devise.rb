
Devise.setup do |config|
  config.secret_key = '8e8fa0d00bd67f11ffff76bd91977ac627de5d368b0ca32151e5a1ac519b840779becfd3d798c829c4e1f352e481b124146498adcf6486086932e5af7fa03889'
  config.mailer_sender = ENV['email']
  config.allow_unconfirmed_access_for = 1.days
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.send_password_change_notification = false
  config.reconfirmable = false
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@]+@[^@]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :get

end
