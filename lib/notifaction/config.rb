require 'yaml'

module Notifaction
  class Cfg

    attr_accessor :hooks, :conf

    def initialize
      conf = YAML::load(File.open(Dir.home + '/.notifaction.yml'))

      @hooks = conf["hooks"] if conf["hooks"]
      @conf = conf["config"] if conf["config"]

      nil
    end

  end
end