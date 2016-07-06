require 'time'
require 'rbconfig'

require 'notifaction/type'
require 'notifaction/types/linux'
require 'notifaction/types/osx'
require 'notifaction/types/terminal'
require 'notifaction/notify'
require 'notifaction/config'
require "notifaction/version"
require 'notifaction/utils'

# module Notifaction
# end

$config = Notifaction::Cfg.new
$config.route