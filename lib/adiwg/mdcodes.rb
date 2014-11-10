# Mdcodes - ADIwg codeLists to be used with adiwgJson and mdEditor
# ... codeLists are maintained in a YAML file 'mdCodes.yml'
# ... the Mdcodes module has methods to access and return codeLists

# History:
# 	Stan Smith 2014-11-07 original script
#   Stan Smith 2014-11-07 add methods to return only codeNames
#   Josh Bradley 2014-11-07 moved resources directory outside lib, add getYamlPath
#   Stan Smith 2014-11-10 added support for JSON returns
#   Stan Smith 2014-11-10 added README.md text

# add main directories to load_path

require 'yaml'
require 'json'

module ADIWG

    module Mdcodes
        # return the path to yaml file.
        def self.getYamlPath
            File.join(File.dirname(__FILE__),'..','..','resources','mdcodes.yml')
        end

        # read the yml file into ruby
        def self.getCodeLists(format='hash')
            file = getYamlPath
			codes = YAML.load_file(file)
			if format == 'json'
				return codes.to_json
			else
				return codes
			end
        end

        # return a single code list
        def self.getCodeList(codeList, format='hash')
            codeLists = getCodeLists
            hCodeList = {}
            hCodeList[codeList] = codeLists[codeList]
			if format == 'json'
				return hCodeList.to_json
			else
				return hCodeList
			end
        end

        # return only code names
        def self.getCodeNames(format='hash')
            codeLists = getCodeLists
            hCodeNames = {}
            codeLists.each do |key, value|
                aItems = value['items']
                aList = []
                aItems.each do |item|
                    aList << item['codeName']
                end
                hCodeNames[key] = aList
			end
			if format == 'json'
				return hCodeNames.to_json
			else
				return hCodeNames
			end
        end

        # return a single code name list
        def self.getCodeName(codeList, format='hash')
            hCodeList = getCodeList(codeList)
            hCodeNames = {}
            aItems = hCodeList[codeList]['items']
            aList = []
            aItems.each do |item|
                aList << item['codeName']
            end
            hCodeNames[codeList] = aList
			if format == 'json'
				return hCodeNames.to_json
			else
				return hCodeNames
			end
        end

    end

end
