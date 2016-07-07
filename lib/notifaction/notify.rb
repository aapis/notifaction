class Notify
  extend Notifaction::Helpers

  # Display a notification bubble
  # @since 0.1.0
  def self.bubble(message, title)
    if Utils.os == :macosx
      handler = Notifaction::Type::OSX.new
    else
      handler = Notifaction::Type::Linux.new
    end

    handler.bubble(message, title)
    handler.quit_ok
  end

  # Display a modal popup with a close button
  # @since 0.1.0
  def self.modal(message, title)
    if Utils.os == :macosx
      handler = Notifaction::Type::OSX.new
    else
      handler = Notifaction::Type::Linux.new
    end

    handler.modal(message, title)
    handler.quit_ok
  end

  # Prints a pre-formatted error message to the console
  # @since 0.1.0
  def self.error(message, config = {})
    handler = Notifaction::Type::Terminal.new
    handler.error(message, config)
    handler.quit unless self.auto_quit_enabled?(config, handler.user_conf)
  end

  # Prints a pre-formatted warning message to the console
  # @since 0.1.0
  def self.warning(message, config = {})
    handler = Notifaction::Type::Terminal.new
    handler.warning(message, config)
  end

  # Prints a pre-formatted informational message to the console
  # @since 0.1.0
  def self.info(message, config = {})
    handler = Notifaction::Type::Terminal.new
    handler.info(message, config)
  end

  # Prints a pre-formatted secondary informational message to the console
  # @since 0.2.0
  def self.note(message, config = {})
    handler = Notifaction::Type::Terminal.new
    handler.note(message, config)
  end

  # Prints a pre-formatted success message to the console
  # @since 0.1.0
  def self.success(message, config = {})
    handler = Notifaction::Type::Terminal.new
    handler.success(message, config)
  end

  # Prints a pre-formatted unstyled message to the console
  # @since 0.1.0
  def self.spit(message, config = {})
    handler = Notifaction::Type::Terminal.new
    handler.spit(message, config)
  end

  # pretty-print a spacer
  # @since 0.1.0
  def self.spacer(config = {})
    handler = Notifaction::Type::Terminal.new
    handler.spacer(config)
  end
end
