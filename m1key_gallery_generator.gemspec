# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'm1key_gallery_generator/version'

Gem::Specification.new do |spec|
  spec.name          = 'm1key_gallery_generator'
  spec.version       = M1keyGalleryGenerator::VERSION
  spec.authors       = ['Mike Huniewicz']
  spec.email         = ['michal.huniewicz.registered@gmail.com']

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'http://mygemserver.com'
  end

  spec.summary       = 'm1key.me-style gallery generator.'
  spec.description   = 'This gem allows you to generate a m1key.me-style gallery based on the JPG files in the working directory.'
  spec.homepage      = 'https://github.com/m1key/m1key_gallery_generator'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'exifr', '~> 1.3.9'

  spec.add_development_dependency 'bundler', '~> 2.3.1'
  spec.add_development_dependency 'rake', '~> 13.0.6'
  spec.add_development_dependency 'minitest', '~> 5.5'
  spec.add_development_dependency 'rspec', '~> 3.2'
end
