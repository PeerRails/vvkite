ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'database_cleaner'
require 'simplecov'
require 'webmock/rspec'


DatabaseCleaner.strategy = :truncation
OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
  :provider => 'twitter',
  :uid => '123545',
  :screen_name => 'random_name',
  :name => 'Random Name'
})

SimpleCov.start 'rails' do
  add_group "Serializers", "app/serializers"
  add_group "Channels", "app/channels"
end
WebMock.disable_net_connect!(allow_localhost: true)
ENV["TWITTER_CONSUMER_KEY"] = "TCK"
ENV["TWITTER_CONSUMER_SECRET"] = "TCS"
ENV["TWITTER_ACCESS_TOKEN"] = "TAK"
ENV["TWITTER_ACCESS_SECRET"] = "TAS"

ActiveRecord::Migration.maintain_test_schema!
RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  #config.use_transactional_tests = true

  config.infer_spec_type_from_file_location!
  config.include FactoryGirl::Syntax::Methods
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
