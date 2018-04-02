# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'alki/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "alki-rails"
  spec.version       = Alki::Rails::VERSION
  spec.authors       = ["Matt Edlefsen"]
  spec.email         = ["matt.edlefsen@gmail.com"]

  spec.summary       = %q{Rails integration for Alki}
  spec.homepage      = "http://alki.io/projects/alki-rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "alki", "~> 0.14"
  spec.add_dependency "alki-reload", "~> 0.3", ">= 0.3.4"
end
