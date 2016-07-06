require 'yaml'

module Notifaction
  module Hooks

    def self.load_all
      conf = YAML::load(File.open(Dir.home + '/.notifaction.yml'))
      conf["plugin_hooks"]
    end

  end
end