Recaptcha.configure do |config|
  # config.site_key = '6Lc91bkUAAAAAA8sr4lMYw_a2qh8ilns1S0XOasJ'
  # config.secret_key = '6Lc91bkUAAAAAJDMh2RXMhmF-N36WvCSSzbOGYEi'
  config.site_key = Rails.application.credentials.dig(:reCAPTCHA, :site_key)
  config.secret_key = Rails.application.credentials.dig(:reCAPTCHA, :secret_key)
end