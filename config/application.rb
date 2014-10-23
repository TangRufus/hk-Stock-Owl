require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module HkStockOwl
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Hong Kong'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # For Foundation 5 & ActiveAdmin
    # See: http://mrdanadams.com/2011/exclude-active-admin-js-css-rails/
    config.assets.precompile += %w( vendor/modernizr admin/active_admin.css admin/active_admin.js )

    # For Heroku
    # See https://devcenter.heroku.com/articles/rails-4-asset-pipeline
    config.serve_static_assets = true
  end
end
