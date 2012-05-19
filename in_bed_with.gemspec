# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'in_bed_with/version'

Gem::Specification.new do |s|
  s.name        = 'in_bed_with'
  s.version     = InBedWith::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Sebastian von Conrad']
  s.email       = ['sebastian@vonconrad.com']
  s.homepage    = 'http://github.com/vonconrad/in_bed_with'
  s.summary     = %q{in_bed_with embeds popular javascript codes into markup}
  s.description = %q{in_bed_with allows javascript code embedding of popular services (such as Google Analytics, Google Adsense and Gauges) into Rails views and other markup}
  s.license     = 'MIT'

  s.rubyforge_project = 'in_bed_with'

  s.files         = ['lib/in_bed_with.rb','lib/in_bed_with/adsense.rb','lib/in_bed_with/analytics.rb','lib/in_bed_with/base.rb',
                      'lib/in_bed_with/gauges.rb', 'lib/in_bed_with/quantcast.rb', 'lib/in_bed_with/railtie.rb', 'lib/in_bed_with/sitemeter.rb',
                      'lib/in_bed_with/version.rb']
  s.test_files    = []
  s.executables   = []
  s.require_paths = ['lib']

  s.add_dependency 'activesupport', '~> 3.1'
  s.add_development_dependency 'rails', '~> 3.1'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec', '~> 2.8.0'
  s.add_development_dependency 'fuubar'
end
