
Devise.setup do |config|
  config.mailer_sender = 'darius_no-reply@scifimania.com'
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 8..72
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
  config.omniauth :facebook, "476472882562822", "f60b5d22111e9919e0395bb62b8e8e04", scope: 'email', info_fields: 'email,name'

end