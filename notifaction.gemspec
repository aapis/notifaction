# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'notifaction/version'

Gem::Specification.new do |spec|
  spec.name          = "notifaction"
  spec.version       = Notifaction::VERSION
  spec.authors       = ["Яyan Priebe"]
  spec.email         = ["rpriebe@me.com"]

  spec.summary       = "Output status messages from your scripts/programs"
  spec.homepage      = "https://rubygems.org/gems/notifaction"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
