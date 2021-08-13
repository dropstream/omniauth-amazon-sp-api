# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/amazon-sp-api/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-amazon-sp-api"
  spec.version       = OmniAuth::AmazonSpApi::VERSION
  spec.authors       = ["Dropstream"]
  spec.email         = ["karl.falconer@getdropstream.com"]
  spec.description   = %q{Amazon Selling Partner API strategy}
  spec.summary       = %q{Amazon Selling Partner API strategy}
  spec.homepage      = "https://github.com/dropstream/omniauth-amazon-sp-api"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'omniauth', '~> 1.0'
  spec.add_dependency 'omniauth-oauth2', '~> 1.1'

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec', '~> 2.13'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'pry-byebug'
end
