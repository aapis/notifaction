module Notifaction
  class Utils

    def self.formatted_time(time = nil)
      if time.nil?
        time = Time.now
      end

      time.strftime("%e/%-m/%Y @ %I:%M:%S%P")
    end

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

    #
    # @since 0.3.0
    def self.recursive_symbolize_keys(hash)
      hash.inject({}){|result, (key, value)|
        new_key = case key
                  when String then key.to_sym
                  else key
                  end
        new_value = case value
                    when Hash then recursive_symbolize_keys(value)
                    else value
                    end
        result[new_key] = new_value
        result
      }
    end

  end
end