require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)
require "notify_on"

# Needed to require this manually or specs wouldn't run for the parent engine.
require 'devise'
require 'simple_form'

module Dummy
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.generators do |g|
      g.test_framework :rspec, :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end
  end
end

