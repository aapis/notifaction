require "net/http"
require "uri"

module Notifaction
  module Type
    class Base

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
        hooks = $config.hooks

        hooks.each do |uri|
          uri = URI.parse(uri)

          response = Net::HTTP.post_form(uri, payload)
          response.code.to_i < 300
        end
      end

    end
  end
end