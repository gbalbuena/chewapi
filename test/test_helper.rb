ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "codeclimate-test-reporter"
require "vcr"

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
require "minitest/pride"

CodeClimate::TestReporter.start

VCR.configure do |config|
  config.cassette_library_dir = "test/cassettes"
  config.hook_into :webmock # or :fakeweb
  config.ignore_hosts 'codeclimate.com'
  config.default_cassette_options = { :record => :new_episodes }
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...
  include FactoryGirl::Syntax::Methods
end
