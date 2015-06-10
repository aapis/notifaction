$:.unshift File.dirname(__FILE__)

class Notify
  # Display a notification bubble
  def self.bubble(message, title)
    begin
      if Utils.os == :macosx
        if !osx_notification(message, title)
          raise "No handler found, cannot show bubble notification"
        end
      else
        if !notifysend(message, title)
          raise "No handler found, cannot show bubble notification"
        #elsif zenity(message, title)
        #  raise "No handler found, cannot show bubble notification"
        end
      end
    rescue Exception => e
      warning("[self.bubble] #{e.message}")
    end
  end

  def self.modal(message, title)
    begin
      if Utils.os == :macosx
        if !osx_modal(message, title)
          raise "No handler found, cannot show system popup"
        end
      end
    rescue Exception => e
      warning("[self.bubble] #{e.message}")
    end
  end

  # Prints a pre-formatted error message to the console
  def self.error(message)
    message = message.split("\n").join("\n\u2716 ")
    inline("\u2716 #{message} - #{Utils.formatted_time}", :red)
    inline("\u2716 Exiting...", :red)

    exit
  end

  # Prints a pre-formatted warning message to the console
  def self.warning(message)
    message = message.split("\n").join("\n\u2011 ")
    inline("\u2011 #{message} - #{Utils.formatted_time}", :yellow)
  end

  # Prints a pre-formatted informational message to the console
  def self.info(message)
    inline("#{message} - #{Utils.formatted_time}", :blue)
  end

  # Prints a pre-formatted secondary informational message to the console
  def self.sinfo(message)
    message = message.split("\n").join("\n\u2011 ")
    inline("\u2011 #{message} - #{Utils.formatted_time}", :cyan)
  end

  # Prints a pre-formatted success message to the console
  def self.success(message)
    message = message.split("\n").join("\n\u2713 ")
    inline("\u2713 #{message} - #{Utils.formatted_time}", :green)
  end

  # Prints a pre-formatted unstyled message to the console
  def self.spit(message)
    inline(message, :null)
  end

  # Send status updates to WorkingOn
  # def self.wo(message, print_info_message = false)
  #   begin
  #     require_relative "plugins/workingon.rb"

  #     plugin = Plugin::WorkingOn.new
  #     plugin.send(message)

  #     if print_info_message
  #       info(message)
  #     end
  #   rescue Exception => e
  #     error("Error notifying WO - #{e.message}", self)
  #   end
  # end

  # pretty-print a spacer
  def self.spacer
    inline("\u2011 =============", :magenta)
  end

  # register new plugins
  # def self.register_plugin(info)
  #   plugin = Plugin.new(info)
  #   plugin.validate
  # end

  private
    # Collate colour and style, build message string in format of 
    # "\e[#{style};#{colour}m#{text}\e[0m"
    def self.inline(message, colour = nil, style = nil)
      puts Style.format(message, colour, style)
    end

    def osx_notification(message, title)
      begin
        @response = `osascript -e 'display notification "#{message}" with title "#{title}"'`

        $?.exitstatus == 0
      rescue SystemExit, Interrupt
        error("Interrupt caught, exiting", self)
      end
    end

    # OSX system modal popup
    def osx_modal(message, title, icon = :caution)
      begin
        @response = `osascript -e 'tell app "System Events" to display dialog "#{message}" buttons {"OK"} default button 1 with title "#{title}" with icon #{icon}'`

        $?.exitstatus == 0
      rescue SystemExit, Interrupt
        error("Interrupt caught, exiting", self)
      end
    end

    # Linux system notification
    def notifysend(message, title)
      begin
        @response = `notify-send "#{title}" "#{message}"`

        $?.exitstatus == 0
      rescue SystemExit, Interrupt
        error("Interrupt caught, exiting", self)
      end
    end

    def zenity(message, title)
      begin
        @response = `echo "message:#{message}" | zenity --notification --listen`

        $?.exitstatus == 0
      rescue SystemExit, Interrupt
        error("Interrupt caught, exiting", self)
      end
    end
end