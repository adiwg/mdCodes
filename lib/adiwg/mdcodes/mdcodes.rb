# Mdcodes - ADIwg codeLists to be used with adiwgJson and mdEditor
# ... codeLists are maintained in a YAML file 'mdCodes.yml'
# ... the Mdcodes module has methods to access and return codeLists

# History:
# 	Stan Smith 2014-11-07 original script

# add main directories to load_path
#$LOAD_PATH.unshift(File.join(File.dirname(__FILE__),'mdcodes'))

require 'version'
require 'yaml'

module ADIWG

	module Mdcodes

		# read the yml file into ruby
		def self.getCodeLists
		  codeLists = YAML.load_file('lib/adiwg/mdcodes/mdcodes.yml')
		end

		# return a single code list
		def self.getCodeList(codeList)
			codeLists = getCodeLists
			myList = codeLists[codeList]
		end

	end

end
