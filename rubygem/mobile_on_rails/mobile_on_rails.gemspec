# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mobile_on_rails/version'

Gem::Specification.new do |spec|
  spec.name          = "mobile_on_rails"
  spec.version       = MobileOnRails::VERSION
  spec.authors       = ["Tyler Standridge"]
  spec.email         = ["tstand90@gmail.com"]
  spec.description   = "A Rails website with an accompanying iOS and Android app"
  spec.summary       = "A Rails website with an accompanying iOS and Android app"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
