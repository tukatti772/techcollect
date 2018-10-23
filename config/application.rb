require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Futuretech
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.i18n.default_locale = :ja

        #デフォルトのタイムゾーンはUTCになってて、データベースにそれを書き込むから時間がずれる。下記で修正
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
  end
end
