lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'm1key_gallery_generator/version'

Gem::Specification.new do |spec|
  spec.name          = 'm1key_gallery_generator'
  spec.version       = M1keyGalleryGenerator::VERSION
  spec.authors       = ['Michal Huniewicz']
  spec.email         = ['REDACTED']
  spec.required_ruby_version = '>= 4.0'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.summary       = 'm1key.me-style gallery generator.'
  spec.description   = 'This gem allows you to generate a m1key.me-style gallery based on the JPG files in the working directory.'
  spec.homepage      = 'https://github.com/m1key/m1key_gallery_generator'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) || f.start_with?('.') }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'exifr', '~> 1.5', '>= 1.5.1'
  spec.add_runtime_dependency 'logger', '~> 1.7'

  spec.add_development_dependency 'bundler', '~> 4.0', '>= 4.0.6'
  spec.add_development_dependency 'rake', '~> 13.3', '>= 13.3.1'
  spec.add_development_dependency 'minitest', '~> 6.0', '>= 6.0.2'
  spec.add_development_dependency 'rspec', '~> 4.0.0.beta1'
  spec.add_development_dependency 'fiddle', '~> 1.1.8'
  spec.add_development_dependency 'htmlentities', '~> 4.4.2'
end
