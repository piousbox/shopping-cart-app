module HandlebarsAssets
  # NOTE: must be an engine because we are including assets in the gem
  class Engine < ::Rails::Engine
    initializer "handlebars_assets.assets.register", :group => :all do |app|

      # _vp_ 20160101
      ::HandlebarsAssets::register_extensions(app.assets)
      app.assets.version += "#{::HandlebarsAssets::VERSION}"
      # config.assets.configure do |env|
      #   ::HandlebarsAssets::register_extensions(env)
      #   app.assets.version += "#{::HandlebarsAssets::VERSION}"
      # end
      
    end
  end
end
