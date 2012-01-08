# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name        = 'in_bed_with'
  s.version     = '0.0.1'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Sebastian von Conrad']
  s.email       = ['sebastian@vonconrad.com']
  s.homepage    = 'http://github.com/vonconrad/in_bed_with'
  s.summary     = %q{in_bed_with allows popular javascript codes to be embedded into markup}
  s.description = %q{}

  s.rubyforge_project = 'in_bed_with'

  s.files         = `git ls-files`.split('\n')
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split('\n')
  s.executables   = `git ls-files -- bin/*`.split('\n').map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_development_dependency 'rails', '~> 3.1'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec', '~> 2.8.0'
  s.add_development_dependency 'fuubar'
end
