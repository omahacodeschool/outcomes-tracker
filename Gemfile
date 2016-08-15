source "https://rubygems.org"

ruby "2.3.0"

gem "autoprefixer-rails"
gem "delayed_job_active_record"
gem "flutie"
gem "high_voltage"
gem "honeybadger"
gem "jquery-rails"
gem "newrelic_rpm", ">= 3.9.8"
gem "pg"
gem "rack-canonical-host"
gem "rails", "~> 4.2.0"
gem "recipient_interceptor"
gem "sass-rails", "~> 5.0"
gem "sprockets", ">= 3.0.0"
gem "sprockets-es6"
gem "title"
gem "uglifier"
gem 'omniauth-github', '~> 1.1', '>= 1.1.2'
gem 'bourbon', '~> 5.0.0.beta.6'
gem 'neat'
gem "refills", group: :development

group :development do
  gem "quiet_assets"
  gem "spring"
  gem "spring-commands-rspec"
  gem "web-console"
  gem "rails-erd"
end

group :development, :test do
  gem "awesome_print"
  gem "bullet"
  gem "bundler-audit", ">= 0.5.0", require: false
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "pry-rails"
  gem "rspec-rails", "~> 3.4.0"
end

group :development, :staging do
  gem "rack-mini-profiler", require: false
end

group :test do
  gem "capybara-webkit"
  gem "database_cleaner"
  gem "formulaic"
  gem "launchy"
  gem "shoulda-matchers"
  gem "simplecov", require: false
  gem "timecop"
  gem "webmock"
end

group :staging, :production do
  gem "rails_stdout_logging"
  gem "rack-timeout"
  gem "puma"
end
