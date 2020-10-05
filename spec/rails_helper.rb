require 'rake'
require 'spec_helper'

require 'simplecov'
SimpleCov.start 'rails' do
  coverage_dir('docs/test/')
  add_filter 'app/channels'
  add_filter 'app/jobs'
  add_filter 'app/mailers'
  add_filter 'lib'
end

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)

abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
Dir[Rails.root.join('spec/support/**/*.rb')].sort.each { |f| require f }

# ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # configured for committee-rails
  config.add_setting :committee_options
  config.committee_options = {
      parse_response_by_content_type: false,
      schema_path: Rails.root.join('docs', 'api', 'openapi.yaml').to_s,
      prefix: '/api/v1'
  }

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.include FactoryBot::Syntax::Methods
  config.include RSpec::RequestDescriber, type: :request

  config.before(:suite) do
    Rails.application.load_tasks
    Rake.application['ridgepole:apply'].invoke
  end

  config.before(:all) do
    FactoryBot.reload
  end

  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
