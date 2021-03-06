require "notifaction/style"
require "net/http"
require "uri"

module Notifaction
  module Type
    class Base
      attr_reader :user_conf

      # Exit code to indicate everything is ok!
      OK = 0
      # Exit code to indicate a force quit (exit) call, meaning the program
      # quit with an error
      QUIT = 1
      # Exit code to indicate that the program exited with a non-zero exit code,
      # but not one that resulted in a force quit
      QUIT_SOFT = 2

      #
      # @since 0.3.0.1
      def initialize
        @user_conf = Notifaction::Cfg.new
        @style = Notifaction::Style.new
      end

      #
      # @since 0.2.8
      def quit
        exit(QUIT)
      end

      #
      # @since 0.4.1
      def quit_soft
        QUIT_SOFT
      end

      #
      # @since 0.4.1
      def ok
        OK
      end

      #
      # @since 0.4.1
      def quit_ok
        exit(OK)
      end

      #
      # @since 0.3.0
      def fire_hooks(payload)
        mux = Mutex.new

        th = Thread.new do
          mux.synchronize do
            hooks = @user_conf.hooks

            return if hooks.nil?

            hooks.each do |uri|
              uri = URI.parse(uri)

              response = Net::HTTP.post_form(uri, payload)
              response.code.to_i < 300
            end
          end
        end.join.exit

        th.status == false
      end
    end
  end
end
