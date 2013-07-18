ENV['RAILS_ENV'] = 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'fabrication'
require 'faker'
require 'database_cleaner'
require 'capybara/poltergeist'
require "email_spec"


RSpec.configure do |config|


  config.include Capybara::DSL
  
  config.use_transactional_fixtures = false
  config.infer_base_class_for_anonymous_controllers = false
  
  Capybara.javascript_driver = :selenium
  #Capybara.javascript_driver = :poltergeist
  
  options = { :js_errors =>  true }
  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, options)
  end
  
  ####################
  ## Database Cleaner
  config.before :each do
    if Capybara.current_driver == :rack_test
      DatabaseCleaner.strategy = :transaction
    else
      DatabaseCleaner.strategy = :truncation
    end
    DatabaseCleaner.start
  end


  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  config.after :each do
    DatabaseCleaner.clean
  end

  config.include(MailerMacros)
  config.before(:each) { reset_email }
end

