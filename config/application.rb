require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EducacionContinua
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :es

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
    config.time_zone = 'Quito'   
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif *.odt)
    config.assets.enabled = true 

    # Correo electronico
    config.active_job.queue_adapter = :deleyed_job
    config.action_mailer.default_url_options = { host: 'example.com'}


    config.api_only = true
    # Mensaje de error
    config.exceptions_app = self.routes

    #CORS
   # Rails.application.config.middleware.insert_before 0, Rack::Cors do
   #    allow do
   #      origins '192.168.54.69:8100'
   #      resource '*',
   #        headers: :any,
   #        methods: %i(get post put patch delete options head)
   #    end
   #  end

config.middleware.insert_before 0, "Rack::Cors" do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :options]
      end
    end
  


  end
end
