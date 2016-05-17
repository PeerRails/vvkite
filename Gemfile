source 'https://rubygems.org'

gem 'rails', '>= 5.0.0.beta3', '< 5.1'
gem 'pg', '~> 0.18'
gem 'active_model_serializers', '~> 0.10.0.rc5'
gem 'puma'
gem 'figaro'
gem 'redis', '~> 3.1'

gem 'sass', '~> 3.4'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'slim-rails'

# gem 'therubyracer', platforms: :ruby

gem 'jquery-rails'
gem 'turbolinks', '~> 5.x'
gem 'jbuilder', '~> 2.0'
# gem 'bcrypt', '~> 3.1.7'

gem 'twitter'
gem 'twitter-text'
gem 'omniauth'
gem 'omniauth-twitter'
gem "pundit"

gem 'russian', '~> 0.6.0'


group :development, :test do
  #gem 'rspec-rails', '~> 3.0'
  %w[rspec-core rspec-expectations rspec-mocks rspec-rails rspec-support].each do |lib|
    gem lib, git: "https://github.com/rspec/#{lib}.git", branch: 'master'
  end
  gem "shoulda-matchers", '~> 3.0'
  gem 'fabrication'
  gem 'database_cleaner'
  gem 'brakeman'
  gem 'simplecov'
  gem 'faker'
  #gem 'webmock'
  gem 'byebug'
end

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem 'rails-footnotes', '>= 4.0.0', '<5'
  gem 'quiet_assets'
  gem 'web-console', '~> 3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :doc do
  gem 'sdoc', require: false
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem "codeclimate-test-reporter"

