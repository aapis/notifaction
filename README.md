# Notifaction

Include terminal and OS notifications in your project.

## Usage

```ruby
gem install notifaction

# ...
require 'notifaction'

# Print an angry red terminal message
# Other methods:
# - success (green)
# - info (blue)
# - note (light blue)
# - warning (yellow)
# - spit (no colour/white)
begin
  call_method
rescue => e
  Notify.error(e.message)
end

# display a bubble notification in OSX and Linux
if install_successful
  Notify.bubble("You can now proceed to use our software...", "Install Successful")
end
```

Plugins extend the base notification functionality, sending messages to online services.  This example will show you how to send log information to a 3rd party service.

```ruby
# ~/.notifaction.yml

hooks:
    - "https://api.yourwebsite.com/messages/receive?token=1am4t0k3n"
```

That's it.  You will start receiving POST requests at the URL(s) listed in the `hooks` section of the configuration file.