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
  spec.description   = %q{adiwg-mdcodes provides code lists for use in ISO 19139 compliant metadata, especially mdJSON.  The codes include all ISO 19115-2 and ISO 19115-1 codes plus additional codes from NGDC and ADIwg.}
  spec.homepage      = "https://github.com/adiwg/mdCodes"
  spec.license       = "UNLICENSED"

  spec.files         = %x(git ls-files).split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(tc|test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~>10"
  spec.add_development_dependency "minitest", "~>5"

  spec.add_runtime_dependency "json", "~>1.8"

end
