require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module CodeRunner
  class Application < Rails::Application
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
    config.assets.initialize_on_precompile = false

    config.generators do |g|
      g.fixture_replacement :fabrication
      g.template_engine     :slim
      g.test_framework      :rspec, :fixture => true, :views => false
    end

    Fabrication.configure do |config|
      fabricator_dir = "data/fabricators"
    end

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      address:              'smtp.gmail.com',
      port:                 587,
      domain:               ENV['KAFFESMAK_SMTP_DOMAIN'],
      user_name:            ENV['KAFFESMAK_SMTP_USERNAME'],
      password:             ENV['KAFFESMAK_SMTP_PASSWORD'],
      authentication:       'plain',
      enable_starttls_auto: true  }
    
  end
end
