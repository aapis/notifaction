module Notifaction
  module Type
    class OSX < Type::Base
      def bubble(message, title)
        @response = `osascript -e 'display notification "#{message}" with title "#{title}"'`
        $?.exitstatus == 0

        fire_hooks(method: __method__, message: message, title: title)
      end

      def modal(message, title, icon = :caution)
        @response = `osascript -e 'tell app "System Events" to display dialog "#{message}" buttons {"OK"} default button 1 with title "#{title}" with icon #{icon}'`
        $?.exitstatus == 0

        fire_hooks(method: __method__, message: message, title: title)
      end
    end
  end
end