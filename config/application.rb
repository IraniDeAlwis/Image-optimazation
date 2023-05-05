require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ImageOptimisation
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    #Add Tinify API key
    #config.tinify.api_key = "YfNcx057LyVwlVnTbypf8mY7CNYW6LVj"

    config.edit_encrypted_file_with = "ENV['EDITOR'] || 'C:\Windows\System32\notepad.exe'"


    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
