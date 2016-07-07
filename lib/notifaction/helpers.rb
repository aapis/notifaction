module Notifaction
  module Helpers
    #
    # @since 0.4.1
    def deprecation_notice(version, config = {})
      handler = Notifaction::Type::Terminal.new
      config[:print] = false

      handler.spit "Deprecated as of #{version}, current #{Notifaction::VERSION}", config
      handler.quit_soft
    end

    #
    # @since 0.4.1
    def auto_quit_enabled?(config, user_conf)
      config[:auto_quit] == false || user_conf.conf["auto_quit"] == false
    end
  end
end