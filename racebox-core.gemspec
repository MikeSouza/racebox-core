# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'racebox/core/version'

Gem::Specification.new do |spec|
  spec.name          = 'racebox-core'
  spec.version       = Racebox::Core::VERSION
  spec.authors       = ['Michael Souza']
  spec.email         = ['contact@michael-souza.com']
  spec.summary       = 'Racebox Core'
  spec.description   = 'Racebox Core'
  spec.homepage      = 'https://github.com/MikeSouza/racebox-core'
  spec.license       = 'MIT'

  spec.files         = Dir.glob('{lib}/**/*') + %w(LICENSE.txt README.md)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'capybara', '~> 2.1'
  spec.add_runtime_dependency 'poltergeist', '>= 1.8.0'
  spec.add_runtime_dependency 'phantomjs', '>= 1.9.8'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.4.0'
  spec.add_development_dependency 'rspec-core', '!= 3.4.0'
end
