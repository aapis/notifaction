module Notifaction
  class Utils
    def self.formatted_time(time = nil)
      if time.nil?
        time = Time.now
      end
      
      time.strftime("%e/%-m/%Y @ %I:%M:%S%P")
    end

    def self.os
      @os ||= (
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
      )
    end
  end
end