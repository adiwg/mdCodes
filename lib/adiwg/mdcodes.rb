# Mdcodes - ADIwg codelists to be used with adiwgJson and mdEditor
# ... codelists are maintained in a YAML file 'mdCodes.yml'
# ... the Mdcodes module has methods to access and return codelists

# History:
#  Stan Smith 2017-08-08 add deprecated parameter to codelists
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

      # return all codelists with all elements
      def self.getAllCodelistsDetail(format='hash', showDeprecated=false)
         path = getYamlPath + '/*.yml'
         hCodelists = {}
         Dir.glob(path) do |item|
            hCodelist = YAML.load_file(item)
            hCodelists[hCodelist['codelistName']] = hCodelist
         end
         unless showDeprecated
            hCodelists.each do |key, value|
               aKeepItems = []
               value['codelist'].each do |item|
                  if item.has_key?('deprecated')
                     unless item['deprecated']
                        aKeepItems << item
                     end
                  else
                     aKeepItems << item
                  end
                  value['codelist'] = aKeepItems
               end
            end
         end
         return hCodelists.to_json if format == 'json'
         return hCodelists
      end

      # return a single codelist with all elements
      def self.getCodelistDetail(codelist, format='hash', showDeprecated=false)
         file = File.join(getYamlPath, codelist + '.yml')
         if File.exist?(file)
            hCodelist = YAML.load_file(file)
            unless showDeprecated
               aKeepItems = []
               hCodelist['codelist'].each do |item|
                  if item.has_key?('deprecated')
                     unless item['deprecated']
                        aKeepItems << item
                     end
                  else
                     aKeepItems << item
                  end
                  hCodelist['codelist'] = aKeepItems
               end
            end
         else
            return nil
         end
         return hCodelist.to_json if format == 'json'
         return hCodelist
      end

      # return all codelist with only the codeName
      def self.getAllStaticCodelists(format='hash', showDeprecated=false)
         hCodelists = {}
         codelists = getAllCodelistsDetail('hash', showDeprecated)
         codelists.each do |key, value|
            aList = []
            value['codelist'].each do |item|
               aList << item['codeName']
            end
            hCodelists[key] = aList
         end
         return hCodelists.to_json if format == 'json'
         return hCodelists
      end

      # return a single codelist with only the codeName
      def self.getStaticCodelist(codelist, format='hash', showDeprecated=false)
         hCodelist = getCodelistDetail(codelist, 'hash', showDeprecated)
         unless hCodelist.nil?
            hCodeNames = {}
            aList = []
            hCodelist['codelist'].each do |item|
               aList << item['codeName']
            end
            hCodeNames[hCodelist['codelistName']] = aList
            return hCodeNames.to_json if format == 'json'
            return hCodeNames
         end
         return nil
      end

   end
end
