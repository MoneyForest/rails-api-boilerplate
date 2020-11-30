source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'active_model_serializers', '~> 0.8.0'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'devise'
gem 'jwt'
gem 'mysql2', '>= 0.4.4'
gem 'puma', '~> 5.1'
gem 'rack-cors'
gem 'rails', '~> 6.0.3.4'
gem 'ridgepole'

group :development, :test do
  gem 'awesome_print'
  gem 'brakeman', require: false
  gem 'committee'
  gem 'committee-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry-byebug'
  gem 'pry-doc', require: false
  gem 'pry-rails'
  gem 'rails_best_practices'
  gem 'rails-erd'
  gem 'reek'
  gem 'rspec'
  gem 'rspec-rails', '~> 4.0.1'
  gem 'rspec-request_describer'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec'
  gem 'simplecov', require: false
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara'
  gem 'rails-controller-testing'
  gem 'rspec_junit_formatter', require: false
  gem 'shoulda-matchers', '~> 4.4'
  gem 'timecop'
  gem 'vcr'
  gem 'webmock'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
