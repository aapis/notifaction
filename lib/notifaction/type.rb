require "net/http"
require "uri"

module Notifaction
  module Type
    class Base
      attr_reader :user_conf

      #
      # @since 0.3.0.1
      def initialize
        @user_conf = Notifaction::Cfg.new
      end

      #
      # @since 0.2.8
      def deprecation_notice(version)
        puts "Deprecated as of #{version}, current #{Notifaction::VERSION}"
      end

      #
      # @since 0.2.8
      def quit
        exit
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

      def fire_hooks_nts(payload)
        hooks = @user_conf.hooks

        return if hooks.nil?

        hooks.each do |uri|
          uri = URI.parse(uri)

          response = Net::HTTP.post_form(uri, payload)
          response.code.to_i < 300
        end
      end
    end
  end
end
