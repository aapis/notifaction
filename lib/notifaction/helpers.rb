module Notifaction
  module Helpers
    # Alert the user that the method they've called is not supported
    # @since 0.4.1
    def deprecation_notice(version, config = {})
      handler = Notifaction::Type::Terminal.new
      handler.warning "Deprecated as of #{version}, current #{Notifaction::VERSION}", config
      handler.quit_soft
    end

    # Should method exit with Type::QUIT?  Mainly used in tests
    # @since 0.4.1
    def auto_quit_enabled?(config, user_conf)
      config[:auto_quit] == false || user_conf.conf["auto_quit"] == false
    end
  end
end