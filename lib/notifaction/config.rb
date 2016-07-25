require "yaml"

module Notifaction
  class Cfg
    attr_reader :hooks, :conf

    #
    # @since 0.4.0
    def initialize
      local_conf = Dir.home + "/.notifaction.yml"
      conf = YAML.load(File.open(local_conf)) if File.exists? local_conf

      @hooks = conf["hooks"] || []
      @conf = conf["config"] || {}

      nil
    end
  end
end
