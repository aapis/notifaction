module Notifaction
  module Type
    class Terminal < Type::Base
      #
      # @since 0.2.8
      def error(message, config)
        config[:symbol] = "\u2716"
        inline(message, config, :red)
      end

      #
      # @since 0.2.8
      def warning(message, config)
        config[:symbol] = "\u2011"
        inline(message, config, :yellow)
      end

      #
      # @since 0.2.8
      def success(message, config)
        config[:symbol] = "\u2713"
        inline(message, config, :green)
      end

      #
      # @since 0.2.8
      def info(message, config)
        config[:symbol] = "\u2011"
        inline(message, config, :blue)
      end

      #
      # @since 0.2.8
      def sinfo(message, config)
        deprecation_notice("0.2.8")

        note(message, config, :cyan)
      end

      #
      # @since 0.2.8
      def note(message, config)
        config[:symbol] = "\u2011"
        inline(message, config, :cyan)
      end

      #
      # @since 0.2.8
      def spit(message, config)
        config[:fancy] = false
        inline(message, config)
      end

      #
      # @since 0.2.8
      def spacer(config)
        config[:symbol] = "\u2011"
        inline("=============", config, :magenta)
      end

      private

      #
      # @since 0.2.8
      def inline(message, config, colour = nil, style = nil)
        if config.empty?
          # no configuration provided, default to showing all config options
          message += " - #{Utils.formatted_time}"
        else
          # update message content based on configuration variables
          message += " - #{Utils.formatted_time}" if show_time(config)
          message = "#{config[:symbol]} #{message}" if show_symbol(config)
        end

        puts @style.format(message, colour, style) unless show_message(config)

        if fire_hooks(method: __method__, message: message, config: config)
          ok
        else
          soft_quit
        end
      end

      #
      # @since 0.4.0
      def show_symbol(config)
        config[:symbol] || config[:fancy] || @user_conf.config("fancy") == true
      end

      #
      # @since 0.4.0
      def show_time(config)
        config[:show_time] || @user_conf.config("show_time")
      end

      #
      # @since 0.4.0
      def show_message(config)
        config[:print] == false || @user_conf.config("print") == false
      end
    end
  end
end
