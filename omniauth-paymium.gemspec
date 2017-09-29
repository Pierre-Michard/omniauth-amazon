# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/paymium/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-paymium"
  spec.version       = OmniAuth::Paymium::VERSION
  spec.authors       = ["Pierre Michard"]
  spec.email         = ["pierre.michard@paymium.com"]
  spec.description   = %q{Login with Paymium OAuth2 strategy for OmniAuth 1.0}
  spec.summary       = %q{Login with Paymium OAuth2 strategy for OmniAuth 1.0}
  spec.homepage      = "https://github.com/Pierre-Michard/omniauth-paymium"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'omniauth', '~> 1.0'
  spec.add_dependency 'omniauth-oauth2', '~> 1.1'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec', '~> 2.13'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'webmock'
end
