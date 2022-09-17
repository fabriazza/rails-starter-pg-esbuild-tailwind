source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.3", ">= 7.0.3.1"

gem "bootsnap", require: false
gem "cssbundling-rails"
gem "dartsass-rails", "~> 0.4.0"
gem "devise", "~> 4.8"
gem "good_job", "~> 3.4"
gem "image_processing", "~> 1.2"
gem "inline_svg", "~> 1.8"
gem "jbuilder"
gem "jsbundling-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "redis", "~> 4.0"
gem "sassc-rails"
gem "simple_form", "~> 5.1"
gem "simple_form-tailwind", "~> 0.1.1"
gem "sprockets-rails"
gem "stimulus-rails"
gem "trestle", "~> 0.9.6"
gem "trestle-search", "~> 0.4.3"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 5.0'
end

group :development do
  gem "erd", "~> 0.8.1"
  gem "rack-mini-profiler"
  gem "spring"
  gem 'guard'
  gem 'guard-rspec', require: false
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
