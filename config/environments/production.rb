require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.enable_reloading = false

  # Eager load code on boot. This eager loads most of Rails and
  # your application in memory, allowing both threaded web servers
  # and those relying on copy on write to perform better.
  # Rake tasks automatically ignore this option for performance.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Ensures that a master key has been made available in either ENV["RAILS_MASTER_KEY"]
  # or in config/master.key. This key is used to decrypt credentials (and other encrypted files).
  # config.require_master_key = true

  # Disable serving static files from the `/public` folder by default since
  # Apache or NGINX already handles this.
  config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present?
  config.public_file_server.headers = {
    'Cache-Control' => 'public, max-age=15552000',
    'Expires' => 1.year.from_now.to_formatted_s(:rfc822)
  }

  # Compress CSS using a preprocessor.
  config.assets.css_compressor = nil

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = false
  #config.assets.gzip = false

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  config.asset_host = "https://#{ENV['HOST']}"
  config.action_controller.asset_host = "https://#{ENV['HOST']}"

  # Specifies the header that your server uses for sending files.
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for Apache
  # config.action_dispatch.x_sendfile_header = "X-Accel-Redirect" # for NGINX

  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :amazon
  # Do not purge old attachments when upload new ones
  config.active_storage.replace_on_assign_to_many = false

  config.active_storage.delivery_method = :proxy

  # Mount Action Cable outside main process or domain.
  # config.action_cable.mount_path = nil
  # config.action_cable.url = "wss://example.com/cable"
  # config.action_cable.allowed_request_origins = [ "http://example.com", /http:\/\/example.*/ ]

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  config.force_ssl = true

  # Include generic and useful information about system operation, but avoid logging too much
  # information to avoid inadvertent exposure of personally identifiable information (PII).
  config.log_level = :info

  # Prepend all log lines with the following tags.
  config.log_tags = [ :request_id ]

  # Use a different cache store in production.
  if ENV["STACKHERO_REDIS_URL_TLS"].present?
    config.cache_store = :redis_cache_store, {
      url: ENV['STACKHERO_REDIS_URL_TLS'],
      connect_timeout:    5,  # Defaults to 1 second
      read_timeout:       0.5, # Defaults to 1 second
      write_timeout:      0.5, # Defaults to 1 second
      reconnect_attempts: 2,   # Defaults to 1
      ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE }, # Disable SSL verification internally for Redis
      # error_handler: -> (method:, returning:, exception:) {
      #   Sentry.capture_exception exception, level: 'warning',
      #     tags: { method: method, returning: returning }
      # }
    }
  else
    config.cache_store = :memory_store
  end

  # Use a real queuing backend for Active Job (and separate queues per environment).
  config.active_job.queue_adapter = :good_job
  config.good_job.execution_mode = :async
  # config.good_job.max_threads = 5
  # config.good_job.poll_interval = 30
  # config.good_job.on_thread_error = -> (exception) { Raven.capture_exception(exception) }

  config.action_mailer.perform_caching = false

  config.action_mailer.delivery_method = :smtp

  config.action_mailer.smtp_settings = {
    address:              "mail.smtp2go.com",
    port:                 "2525",
    authentication:       "plain",
    enable_starttls_auto: true,
    domain:               ENV["SMTP_DOMAIN"],
    user_name:            ENV["SMTP_LOGIN"],
    password:             ENV["SMTP_PASSWORD"]
  }

  # Ignore bad email addresses and do not raise email delivery errors.
  # Set this to true and configure the email server for immediate delivery to raise delivery errors.
  # config.action_mailer.raise_delivery_errors = false

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true

  # Don't log any deprecations.
  config.active_support.report_deprecations = false

  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = Logger::Formatter.new

  # Use a different logger for distributed setups.
  # require "syslog/logger"
  # config.logger = ActiveSupport::TaggedLogging.new(Syslog::Logger.new "app-name")

  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  config.action_mailer.default_url_options = { host: ENV.fetch('HOST', nil) }

  config.action_mailer.asset_host = "https://#{ENV['HOST']}"

  config.action_controller.default_url_options = { host: ENV.fetch('HOST', nil) }

  Rails.application.routes.default_url_options[:host] = ENV.fetch('HOST', nil)

  Devise::Async.enabled = true

  # Enable DNS rebinding protection and other `Host` header attacks.
  # config.hosts = [
  #   "example.com",     # Allow requests from example.com
  #   /.*\.example\.com/ # Allow requests from subdomains like `www.example.com`
  # ]
  # Skip DNS rebinding protection for the default health check endpoint.
  # config.host_authorization = { exclude: ->(request) { request.path == "/up" } }
end
