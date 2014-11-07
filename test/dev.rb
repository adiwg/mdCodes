
# uncomment next 2 lines to run code (not gem) ....
lib = File.expand_path('lib')
res = File.expand_path('resources')
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
$LOAD_PATH.unshift(res)

require 'adiwg-mdcodes'
require 'json'
require 'pp'

codelists = ADIWG::Mdcodes.getCodeNames
pp codelists
# puts codelists.to_json