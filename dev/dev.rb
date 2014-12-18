
# uncomment next 2 lines to run code (not gem) ....
lib = File.expand_path('lib')
res = File.expand_path('resources')
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
$LOAD_PATH.unshift(res)

require 'adiwg-mdcodes'
require 'json'
require 'pp'

# codelists = ADIWG::Mdcodes.getAllCodeistsDetail
# codelists = ADIWG::Mdcodes.getCodelistDetail('iso_characterSet')
# codelists = ADIWG::Mdcodes.getAllStaticCodelists
codelists = ADIWG::Mdcodes.getStaticCodelist('iso_characterSet')
pp codelists
# puts codelists.to_json
