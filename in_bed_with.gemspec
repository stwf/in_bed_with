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

  s.rubyforge_project = 'in_bed_with'

  s.files         = `git ls-files`.split('\n')
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split('\n')
  s.executables   = `git ls-files -- bin/*`.split('\n').map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'activesupport', '~> 3.1'
  s.add_development_dependency 'rails', '~> 3.1'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec', '~> 2.8.0'
  s.add_development_dependency 'fuubar'
end
