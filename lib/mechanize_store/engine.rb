module MechanizeStore
  class Engine < ::Rails::Engine
    isolate_namespace MechanizeStore

    config.generators.templates.unshift File.expand_path("lib/templates", root)

    config.generators do |g|
      g.test_framework false
      g.assets false
      g.helper false
    end

    MechanizeStore::Engine.config.i18n.default_locale = I18n.default_locale
  end
end
