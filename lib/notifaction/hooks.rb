require 'yaml'

module Notifaction
  module Hooks

    def self.num_lines(file)
      File.foreach(file).inject(0) {|c, line| c+1}
    end

    def self.load_all
      conf = YAML::load(File.open(Dir.home + '/.notifaction.yml'))
      conf["plugin_hooks"]
    end

  end
end