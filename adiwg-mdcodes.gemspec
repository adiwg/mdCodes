# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'adiwg/mdcodes/version'

Gem::Specification.new do |spec|
  spec.name          = "adiwg-mdcodes"
  spec.version       = ADIWG::Mdcodes::VERSION
  spec.authors       = ["stansmith907"]
  spec.email         = ["stansmith@usgs.gov"]
  spec.summary       = %q{Write a short summary. Required.}
  spec.description   = %q{Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "UNLICENSED"

  spec.files         = %x(git ls-files).split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(tc|test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_runtime_dependency "json", "~>1.8"
  spec.add_runtime_dependency "yaml"
  spec.add_runtime_dependency "builder", "~>3.2"

end
