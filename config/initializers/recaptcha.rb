Recaptcha.configure do |config|
  config.site_key = Rails.application.credentials.dig(:reCAPTCHA, :site_key)
  config.secret_key = Rails.application.credentials.dig(:reCAPTCHA, :secret_key)
end