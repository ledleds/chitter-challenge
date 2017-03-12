ENV["RACK_ENV"] = 'test'

require File.join(File.dirname(__FILE__), '..', './app/app.rb')

require 'coveralls'
require 'simplecov'
require 'capybara/rspec'
require 'database_cleaner'

require './app/app'
require './app/models/user'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

Capybara.app = Chitter

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
