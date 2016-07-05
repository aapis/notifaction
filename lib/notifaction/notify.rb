class Notify
  # Display a notification bubble
  def self.bubble(message, title)
    if Utils.os == :macosx
      handler = Notifaction::Type::OSX.new
    else
      handler = Notifaction::Type::Linux.new
    end

    handler.bubble(message, title)
    handler.quit
  end

  def self.modal(message, title)
    if Utils.os == :macosx
      handler = Notifaction::Type::OSX.new
    else
      handler = Notifaction::Type::Linux.new
    end

    handler.modal(message, title)
    handler.quit
  end

  # Prints a pre-formatted error message to the console
  def self.error(message, config = {})
    handler = Notifaction::Type::Terminal.new
    handler.error(message, config)
    handler.quit unless config[:auto_quit] == false
  end

  # Prints a pre-formatted warning message to the console
  def self.warning(message, config = {})
    handler = Notifaction::Type::Terminal.new
    handler.warning(message, config)
  end

  # Prints a pre-formatted informational message to the console
  def self.info(message, config = {})
    handler = Notifaction::Type::Terminal.new
    handler.info(message, config)
  end

  # Prints a pre-formatted secondary informational message to the console
  def self.sinfo(message, config = {})
    handler = Notifaction::Type::Terminal.new
    handler.note(message, config)
  end

  def self.note(message, config = {})
    handler = Notifaction::Type::Terminal.new
    handler.note(message, config)
  end

  # Prints a pre-formatted success message to the console
  def self.success(message, config = {})
    handler = Notifaction::Type::Terminal.new
    handler.success(message, config)
  end

  # Prints a pre-formatted unstyled message to the console
  def self.spit(message, config = {})
    handler = Notifaction::Type::Terminal.new
    handler.spit(message, config)
  end

  # Send status updates to WorkingOn
  def self.workingon(message, print_info_message = false)
    begin
      plugin = Plugin::WorkingOn.new
      plugin.fire(message)

      if print_info_message
        info(message)
      end
    rescue Exception => e
      error("Error notifying WO - #{e.message}")
    end
  end

  # pretty-print a spacer
  def self.spacer(config = {})
    handler = Notifaction::Type::Terminal.new
    handler.spacer(config)
  end

  def self.configure
    yield self if block_given?
  end

  def self.print_output
    true
  end

  def self.print_timestamps
    true
  end

  # register new plugins
  def self.plugins=(plugin_config_arr)
    plugin_config_arr.each do |hash|
      hash.each_pair do |plugin, key|
        # include the requested plugin
        require_relative "plugins/#{plugin.downcase}.rb"

        instance_variable_set("@#{plugin}_key".to_sym, key)
      end
    end
  end

end
