module Notifaction
  class Utils
    # Returns a formatted time string
    # Used, mainly, for printing timestamps next to terminal output
    # @since 0.0.1
    def self.formatted_time(time = nil)
      if time.nil?
        time = Time.now
      end

      time.strftime("%e/%-m/%Y @ %I:%M:%S%P")
    end

    # Determine the current OS
    # @since 0.0.1
    def self.os
      host_os = RbConfig::CONFIG['host_os']

      case host_os
      when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
        :windows
      when /darwin|mac os/
        :macosx
      when /linux/
        :linux
      when /solaris|bsd/
        :unix
      else
        puts "unknown os: #{host_os.inspect}"
      end
    end
  end
end
