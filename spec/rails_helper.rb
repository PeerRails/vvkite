ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'database_cleaner'
require 'simplecov'


DatabaseCleaner.strategy = :truncation
OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
  :provider => 'twitter',
  :uid => '123545',
  :screen_name => 'random_name',
  :name => 'Random Name'
})

SimpleCov.start 'rails'

ActiveRecord::Migration.maintain_test_schema!
RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  #config.use_transactional_tests = true

  config.infer_spec_type_from_file_location!
end
