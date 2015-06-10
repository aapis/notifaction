module Plugin
  class WorkingOn
    def send(message)
      Net::HTTP.post_form(URI(sprintf(api_endpoint, api_key)), :task => CGI.escapeHTML(message))
    end

    def api_endpoint
      "https://api.workingon.co/hooks/incoming?token=%s"
    end

    def api_key
      'key'
    end
  end
end