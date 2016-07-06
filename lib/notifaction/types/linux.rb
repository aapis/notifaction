module Notifaction
  module Type
    class Linux < Type::Base

      def bubble(message, title)
        @response = `notify-send "#{title}" "#{message}"`
        $?.exitstatus == 0

        fire_hooks({ method: __method__, message: message, title: title })
      end

      def modal(message, title)
        nil
      end

    end
  end
end