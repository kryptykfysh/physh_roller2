# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'physh_roller/version'

Gem::Specification.new do |spec|
  spec.name          = "physh_roller"
  spec.version       = PhyshRoller::VERSION
  spec.authors       = ["Kryptykfysh"]
  spec.email         = ["kryptykfysh@kryptykfysh.co.uk"]
  spec.summary       = %q{A dice rolling application.}
  spec.description   = <<-EOF
    A Ruby code dice rolling application that can be used both as a
    standalone commandline application, and also mixed in to other 
    applications as a module.
  EOF
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec', '~> 3.1', '>= 3.1.0'
  spec.add_development_dependency 'guard-rspec', '~> 4.3', '>= 4.3.1'
  spec.add_development_dependency 'faker', '~> 1.4', '>= 1.4.3'
  spec.add_development_dependency 'factory_girl', '~> 4.5', '>= 4.5.0'
end
