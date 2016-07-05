module Notifaction
  module Type
    class Linux < Type::Base

      def bubble(message, title)
        @response = `notify-send "#{title}" "#{message}"`
        $?.exitstatus == 0
      end

      def modal(message, title)
        nil
      end

    end
  end
end