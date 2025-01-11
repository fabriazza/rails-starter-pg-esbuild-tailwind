source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.4.1"

gem "rails", "~> 8.0.1", ">= 8.0.1"

gem "bootsnap", require: false
gem "cssbundling-rails"
gem "devise", "~> 4.8"
gem "good_job", "~> 3.4"
gem "image_processing", "~> 1.2"
gem "inline_svg", "~> 1.8"
gem "jbuilder"
gem "jsbundling-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 6.4.3"
gem "redis", "~> 4.0"
gem "simple_form", "~> 5.1"
gem "simple_form-tailwind", "~> 0.1.1"
gem "sitemap_generator", "~> 6.3"
gem "sprockets-rails"
gem "stimulus-rails"
gem "trestle", "~> 0.10.0"
gem "trestle-search", "~> 0.5.1"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 5.0'
end

group :development do
  gem 'brakeman'
  gem "bullet", "~> 7.2"
  gem 'guard'
  gem 'guard-rspec', require: false
  gem "letter_opener"
  gem "rubocop-rails-omakase", require: false
  gem "web-console"
  gem 'rack-mini-profiler',require: false
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

