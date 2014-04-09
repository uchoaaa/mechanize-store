module MechanizeStore
    class Engine < ::Rails::Engine
        isolate_namespace MechanizeStore

        config.generators.templates.unshift File.expand_path("lib/templates", root)

        config.generators do |g|
            g.test_framework :rspec, :fixture => false
            g.fixture_replacement :factory_girl, :dir => 'spec/factories'
            g.assets false
            g.helper false
        end

        MechanizeStore::Engine.config.i18n.default_locale = I18n.default_locale

    end
end
