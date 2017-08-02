# Mdcodes - ADIwg codeLists to be used with adiwgJson and mdEditor
# ... codeLists are maintained in a YAML file 'mdCodes.yml'
# ... the Mdcodes module has methods to access and return codeLists

# History:
#  Stan Smith 2017-08-02 add deprecated element to YAML codelist
#  Stan Smith 2014-12-18 split codelists into individual YAML file
#  Stan Smith 2014-11-10 added README.md text
#  Stan Smith 2014-11-10 added support for JSON returns
#  Josh Bradley 2014-11-07 moved resources directory outside lib, add getYamlPath
#  Stan Smith 2014-11-07 add methods to return only codeNames
# 	Stan Smith 2014-11-07 original script

require 'yaml'
require 'json'

module ADIWG
   module Mdcodes

      # return the path to yaml files.
      def self.getYamlPath
         File.join(File.dirname(File.expand_path(__FILE__)), '..', '..', 'resources')
      end

      # return all codelists with full details
      def self.getAllCodeistsDetail(format='hash')
         path = getYamlPath + '/*.yml'
         hCodeLists = {}
         Dir.glob(path) do |item|
            hCodeList = YAML.load_file(item)
            hCodeLists[hCodeList['codelistName']] = hCodeList
         end
         if format == 'json'
            return hCodeLists.to_json
         else
            return hCodeLists
         end
      end

      # return a single codelist with full details
      def self.getCodelistDetail(codeList, format='hash')
         file = File.join(getYamlPath, codeList + '.yml')
         if File.exist?(file)
            hCodeList = YAML.load_file(file)
         else
            return nil
         end
         if format == 'json'
            return hCodeList.to_json
         else
            return hCodeList
         end
      end

      # return all static codelist with only the item names
      def self.getAllStaticCodelists(format='hash')
         codeLists = getAllCodeistsDetail
         hCodeLists = {}
         codeLists.each do |key, value|
            if value['codelistType'] == 'staticList'
               aItems = value['codelist']
               aList = []
               aItems.each do |item|
                  aList << item['codeName']
               end
               hCodeLists[key] = aList
            end
         end
         if format == 'json'
            hCodeLists.to_json if format == 'json'
         else
            return hCodeLists
         end
      end

      # return a single static codelist with only the item names
      def self.getStaticCodelist(codeList, format='hash')
         hCodeList = getCodelistDetail(codeList)
         if hCodeList
            hCodeNames = {}
            aItems = hCodeList['codelist']
            aList = []
            aItems.each do |item|
               aList << item['codeName']
            end
            hCodeNames[hCodeList['codelistName']] = aList
            if format == 'json'
               return hCodeNames.to_json
            else
               return hCodeNames
            end
         else
            return nil
         end
      end

   end
end
