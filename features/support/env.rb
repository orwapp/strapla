#require 'cucumber/rails'
#require 'rubygems'
require 'capybara'
require 'bundler'
require 'database_cleaner'

Bundler.setup :default, :development, :test
#require "#{Rails.root}/spec/fabricators/*"  
#require "#{Rails.root}/spec/fabricators/**/*fabricator.rb



Capybara.run_server = false
#Capybara.register_driver(:selenium){ |app| Capybara::Selenium::Driver.new(app, { :browser => :chrome }) }
Capybara.register_driver(:selenium){ |app| Capybara::Selenium::Driver.new(app, { :browser => :firefox }) }
Capybara.default_driver = :selenium

# Capybara defaults to XPath selectors rather than Webrat's default of CSS3. In
# order to ease the transition to Capybara we set the default here. If you'd
# prefer to use XPath just remove this line and adjust any selectors in your
# steps to use the XPath syntax.
Capybara.default_selector = :css

# Sometimes we want to override this default behaviour and allow Rails to rescue
# exceptions and display an error page (just like when the app is running in production).
# Typical scenarios where you want to do this is when you test your error pages.
# There are two ways to allow Rails to rescue exceptions:
#
# 1) Tag your scenario (or feature) with @allow-rescue
#
# 2) Set the value below to true. Beware that doing this globally is not
# recommended as it will mask a lot of errors for you!
#
#ActionController::Base.allow_rescue = false


