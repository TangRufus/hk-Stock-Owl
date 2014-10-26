Telapi.config do |config|
  config.account_sid = Rails.application.secrets.telapi_account_sid
  config.auth_token  = Rails.application.secrets.telapi_auth_token
end
