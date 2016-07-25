require "yaml"

module Notifaction
  class Cfg
    #
    # @since 0.4.0
    def initialize
      local_conf = Dir.home + "/.notifaction.yml"

      conf = {}
      conf = YAML.load(File.open(local_conf)) if File.exists? local_conf

      @hooks = conf["hooks"] ||= []
      @config = conf["config"] ||= {}

      nil
    end

    #
    # @since 0.4.3
    def hook(item)
      return if @hooks.empty? || item.nil?
      @hooks[item.to_sym]
    end

    #
    # @since 0.4.3
    def hooks
      @hooks
    end

    #
    # @since 0.4.3
    def config(item)
      return if @config.empty? || item.nil?
      @config[item.to_sym]
    end
  end
end
