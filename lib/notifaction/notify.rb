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
    handler.quit unless self.auto_quit_enabled(config)
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
    self.deprecation_notice("0.3.0")
  end

  # pretty-print a spacer
  def self.spacer(config = {})
    handler = Notifaction::Type::Terminal.new
    handler.spacer(config)
  end

  def self.configure
    self.deprecation_notice("0.3.0")

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
    self.deprecation_notice("0.3.0")
  end

  private

  #
  # @since 0.2.8
  def deprecation_notice(version)
    puts "Deprecated as of #{version}, current #{Notifaction::VERSION}"
  end

  #
  # @since 0.3.0
  def self.auto_quit_enabled(config)
    config[:auto_quit] == false || $config.conf["auto_quit"] == false
  end
end
