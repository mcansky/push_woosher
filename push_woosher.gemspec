# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'push_woosher/version'

Gem::Specification.new do |spec|
  spec.name          = "push_woosher"
  spec.version       = PushWoosher::VERSION
  spec.authors       = ["Thomas Riboulet"]
  spec.email         = ["riboulet@gmail.com"]
  spec.summary       = %q{A simple wrapper for Push Woosh.}
  spec.description   = %q{A simple wrapper for Push Woosh.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'ffaker'
  spec.add_development_dependency 'rspec', '~> 3.0.0'
  spec.add_development_dependency 'rspec-its', '~> 1.0.1'
  spec.add_dependency 'faraday'
  spec.add_dependency 'virtus'
  spec.add_dependency 'activesupport', '= 3.2.18'
end
