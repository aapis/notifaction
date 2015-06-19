module Plugin
  class WorkingOn
    def send(message)
      log = File.new('./wo-digest.log')

      open(log, 'a') do |file|
        file.write("#{message}\n")
      end

      # enough messages have been stored, send digest
      if Plugin::num_lines(log) > 3
        digest = open(log, 'r').read

        Net::HTTP.post_form(URI(sprintf(api_endpoint, api_key)), :task => CGI.escapeHTML(digest.split("\n").uniq.join(', ')))
        
        # reset digest after sending
        File.truncate(log, 0)
      end
    end

    def api_endpoint
      "https://api.workingon.co/hooks/incoming?token=%s"
    end

    def api_key
      Notify.instance_variable_get('@WorkingOn_key')
    end
  end
end