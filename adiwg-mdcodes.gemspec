# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'adiwg/mdcodes/version'

Gem::Specification.new do |spec|
  spec.name          = "adiwg-mdcodes"
  spec.version       = ADIWG::Mdcodes::VERSION
  spec.authors       = ["stansmith907, jlblcc"]
  spec.email         = ["stansmith@usgs.gov"]
  spec.summary       = %q{adiwg-mdcodes provides code lists for mdJSON.}
  spec.description   = %q{adiwg-mdcodes provides code lists for use with editors of ISO 19115-1, ISO 19115-2, ISO 19110, and mdJson compliant metadata.  Some codelists include extensions added by the Alaska Data Integration working group (ADIwg).}
  spec.homepage      = "https://github.com/adiwg/mdCodes"
  spec.license       = "UNLICENSED"

  spec.files         = %x(git ls-files).split($/).delete_if {|fn| /resources\/json\/.*$/.match(fn) }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(tc|test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2"
  spec.add_development_dependency "rake", "~>12"
  spec.add_development_dependency "minitest", "~>5"

  spec.add_runtime_dependency "json", "~>2.0"

end
