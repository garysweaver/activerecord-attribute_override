Gem::Specification.new do |s|
  s.name        = 'activerecord-attribute-override'
  s.version     = '0.0.1'
  s.authors     = ['Gary S. Weaver']
  s.email       = ['garysweaver@gmail.com']
  s.homepage    = 'https://github.com/garysweaver/activerecord-attribute-override'
  s.summary     = %q{Lets you easily override instance attributes in activerecord.}
  s.description = %q{Adds methods to your models to let you easily override instance attributes in specific environments.}
  s.files = Dir['lib/**/*'] + ['Rakefile', 'README.md']
  s.license = 'MIT'
  s.add_dependency 'activerecord'
end
