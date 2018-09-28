require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

if ['development', 'test'].include? ENV['RAILS_ENV']
  #Dotenv::Railtie.load
end

DEFAULT_ERROR_MESSAGE = ENV['DEFAULT_ERROR_MESSAGE']

module Acs
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.time_zone = "America/Lima"
    config.active_record.default_timezone = :local
    config.autoload_paths += Dir[Rails.root.join('app', 'models', '*/')]
    #config.file_watcher = ActiveSupport::EventedFileUpdateChecker
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end

