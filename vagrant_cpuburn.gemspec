# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant_cpuburn/version'

Gem::Specification.new do |spec|
  spec.name          = "vagrant_cpuburn"
  spec.version       = VagrantCPUBurn::VERSION
  spec.authors       = ["Magellnea"]
  spec.email         = ["magellanea@gmail.com"]
  spec.summary       = "CPUBurn plugin For Vagrant"
  spec.description   = "Implement cpuburn failure type for vagrant machines"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
