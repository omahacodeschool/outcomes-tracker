if ENV.fetch("COVERAGE", false)
  require "simplecov"

  # if ENV["CIRCLE_ARTIFACTS"]
  #   dir = File.join(ENV["CIRCLE_ARTIFACTS"], "coverage")
  #   SimpleCov.coverage_dir(dir)
  # end

  SimpleCov.start "rails"
end

require "webmock/rspec"

# module IntegrationSpecHelper
#   def login_with_oauth(service = :github)
#     visit "/auth/#{service}"
#   end
# end

# http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end

  # config.include IntegrationSpecHelper, :type => :request
  config.example_status_persistence_file_path = "tmp/rspec_examples.txt"
  config.order = :random
end

# Capybara.default_host = "http://example.org"

# OmniAuth.config.test_mode = true
# OmniAuth.config.add_mock(:github, {
#   :uid => '12345',
#   :nickname => 'testrobot'
# })

WebMock.disable_net_connect!(allow_localhost: true)
