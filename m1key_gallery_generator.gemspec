lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'm1key_gallery_generator/version'

Gem::Specification.new do |spec|
  spec.name          = 'm1key_gallery_generator'
  spec.version       = M1keyGalleryGenerator::VERSION
  spec.authors       = ['Michal Huniewicz']
  spec.email         = ['REDACTED']
  spec.required_ruby_version = '>= 3.0'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.summary       = 'm1key.me-style gallery generator.'
  spec.description   = 'This gem allows you to generate a m1key.me-style gallery based on the JPG files in the working directory.'
  spec.homepage      = 'https://github.com/m1key/m1key_gallery_generator'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'exifr', '~> 1.4', '>= 1.4.0'

  spec.add_development_dependency 'bundler', '>= 2.4.10'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'minitest', '~> 5.15'
  spec.add_development_dependency 'rspec', '~> 3.13'
  spec.add_development_dependency 'fiddle', '~> 1.1.8'
end
