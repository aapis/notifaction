Gem::Specification.new do |s|
  s.name          = 'notifaction'
  s.version       = '0.0.1'
  s.date          = '2015-06-10'
  s.summary       = "Notification Satisfaction"
  s.description   = "Include terminal and OS notifications in your project"
  s.authors       = ["Ryan Priebe"]
  s.email         = 'hello@ryanpriebe.com'
  s.files         = ["lib/notifaction.rb", "lib/utils.rb", "lib/notify.rb", "lib/style.rb"]
  s.files        += Dir['lib/plugins/*.rb']
  s.homepage      = 'http://rubygems.org/gems/notifaction'
  s.license       = 'MIT'
end