require "yaml"

module Notifaction
  class Cfg
    attr_reader :hooks, :conf

    def initialize
      conf = YAML::load(File.open(Dir.home + '/.notifaction.yml'))

      @hooks = conf["hooks"] || []
      @conf = conf["config"] || {}

      nil
    end
  end
end
