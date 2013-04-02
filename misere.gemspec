# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'misere/version'

Gem::Specification.new do |spec|
  spec.name          = "misere"
  spec.version       = Misere::VERSION
  spec.authors       = ["Masafumi Yokoyama"]
  spec.email         = ["myokoym@gmail.com"]
  spec.summary       = %q{Misere is a file viewer. CLI launch.}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/myokoym/misere"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency("gtk3")

  spec.add_development_dependency("bundler", "~> 1.3")
  spec.add_development_dependency("rake")
end
