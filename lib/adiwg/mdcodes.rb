# Mdcodes - ADIwg codeLists to be used with adiwgJson and mdEditor
# ... codeLists are maintained in a YAML file 'mdCodes.yml'
# ... the Mdcodes module has methods to access and return codeLists

# History:
# 	Stan Smith 2014-11-07 original script
#   Stan Smith 2014-11-07 add methods to return only codeNames
#   Josh Bradley 2014-11-07 moved resources directory outside lib, add getYamlPath

# add main directories to load_path

require 'yaml'

module ADIWG

    module Mdcodes
        # return the path to yaml file.
        def self.getYamlPath
            File.join(File.dirname(__FILE__),'..','..','resources','mdcodes.yml')
        end

        # read the yml file into ruby
        def self.getCodeLists
            file = getYamlPath
            return YAML.load_file(file)
        end

        # return a single code list
        def self.getCodeList(codeList)
            codeLists = getCodeLists
            hCodeList = {}
            hCodeList[codeList] = codeLists[codeList]
            return hCodeList
        end

        # return only code names
        def self.getCodeNames
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
            return hCodeNames
        end

        # return a single code name list
        def self.getCodeName(codeList)
            hCodeList = getCodeList(codeList)
            hCodeNames = {}
            aItems = hCodeList[codeList]['items']
            aList = []
            aItems.each do |item|
                aList << item['codeName']
            end
            hCodeNames[codeList] = aList
            return hCodeNames
        end

    end

end
