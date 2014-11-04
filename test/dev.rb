
# uncomment next 2 lines to run code (not gem) ....
lib = File.expand_path('lib')
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'adiwg-mdcodes'
require 'json'
require 'pp'

codelists = ADIWG::Mdcodes.getCodeLists
pp codelists
puts codelists.to_json