source "https://rubygems.org"

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "4.0.6"

gem "rails", "~> 8.1.3"
gem "pg", "~> 1.6"
gem "puma", ">= 7.0"

gem "propshaft"
gem "cssbundling-rails"
gem "jsbundling-rails"
gem "stimulus-rails"
gem "turbo-rails"

gem "solid_cache"
gem "solid_cable"
gem "solid_queue"

gem "bootsnap", require: false
gem "image_processing", "~> 2.1"
gem "ruby-vips", "~> 2.3"
gem "jbuilder"

gem "devise", "~> 5.0"
gem "inline_svg"
gem "simple_form"
gem "simple_form-tailwind"
gem "sitemap_generator"
gem "trestle", "~> 0.10.1"
gem "trestle-search", "~> 0.5.1"

gem "kamal", require: false
gem "thruster", require: false

gem "tzinfo-data", platforms: %i[ windows jruby ]

group :development, :test do
  gem "brakeman", require: false
  gem "bundler-audit", require: false
  gem "debug", platforms: :mri, require: "debug/prelude"
  gem "dotenv-rails"
  gem "factory_bot_rails"
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "bullet"
  gem "letter_opener"
  gem "rack-mini-profiler", require: false
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
