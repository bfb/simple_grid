require 'simple_grid'

module SimpleGrid
  class Engine < Rails::Engine
    #config.autoload_paths += %W(#{config.root})
    config.autoload_paths << config.root
  end
end