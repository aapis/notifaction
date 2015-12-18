require 'notifaction/style'

module Notifaction
  module Type
    def self.error(message)

    end
    class Terminal < Type::Base

      #
      # @since 0.2.8
      def error(message, config)
        inline(message, config, :yellow)
      end

      #
      # @since 0.2.8
      def warning(message, config)
        inline(message, config, :yellow)
      end

      #
      # @since 0.2.8
      def success(message, config)
        inline(message, config, :green)
      end

      #
      # @since 0.2.8
      def info(message, config)
        inline(message, config, :blue)
      end

      #
      # @since 0.2.8
      def sinfo(message, config)
        deprecation_notice('0.2.8')

        note(message, config, :cyan)
      end

      #
      # @since 0.2.8
      def note(message, config)
        inline(message, config, :cyan)
      end

      #
      # @since 0.2.8
      def spit(message, config)
        inline(message, config)
      end

      #
      # @since 0.2.8
      def spacer
        inline("\u2011 =============", {}, :magenta)
      end

      private

      #
      # @since 0.2.8
      def inline(message, config = {}, colour = nil, style = nil)
        # formatting options
        message += " - #{Utils.formatted_time}" if config[:show_time]
        message = "#{config[:symbol]} #{message}" if config[:fancy]

        puts Style.format(message, colour, style)
      end

    end
  end
end