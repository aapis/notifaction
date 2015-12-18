module Notifaction
  module Type
    class Base

      #
      # @since 0.2.8
      def deprecation_notice(version)
        puts "Deprecated as of #{version}"
      end

      #
      # @since 0.2.8
      def quit
        exit
      end

    end
  end
end