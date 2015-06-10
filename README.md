# Notifaction

Include terminal and OS notifications in your project.

## Usage

```ruby
require 'notifaction'

# Print an angry red terminal message
# Other methods:
# - success (green)
# - info (blue)
# - sinfo (light blue)
# - warning (yellow)
# - spit (white)
begin
  call_method
rescue => e
  Notify.error(e.message)
end

# display a bubble notification in OSX and Linux
if install_successful
  Notify.bubble("You can now proceed to use our software...", "Install Successful")
end

# Plugins extend the base notification functionality, sending messages to
# online services
# This example updates your status on https://www.workingon.co/
if task.complete
  Notify.wo("Task complete: #{task}")
end
`