=begin
* Description: Test Mdcodes methods
* Author: Josh Bradley
* Date: 2014-11-07
* License: Public Domain
=end

require 'minitest/autorun'
require File.join(File.dirname(__FILE__), '..', 'lib', 'adiwg-mdcodes.rb')

class TestMdcodes < Minitest::Test

   def test_parseYaml
      @errors = Array.new

      path = ADIWG::Mdcodes.getYamlPath
      Dir["#{File.join(path, '**/*.yml')}"].each do |fname|
         begin
            YAML.load_file(fname)
         rescue Exception
            @errors << "Could not parse YAML: #{fname}"
         end
      end
      assert(@errors.empty?, @errors.join("\n"))
   end

   def test_yamlResourceDir
      yamlDir = ADIWG::Mdcodes.getYamlPath
      assert(Dir.exist?(yamlDir), 'Did not find resource Directory.')
   end

   def test_getAllCodelistsDetail
      assert_instance_of(Hash, ADIWG::Mdcodes.getAllCodelistsDetail)
   end

   def test_getCodelistDetail
      yaml = ADIWG::Mdcodes.getAllCodelistsDetail
      refute_empty(yaml)

      yaml.keys.each do |key|
         assert_instance_of(Hash, ADIWG::Mdcodes.getCodelistDetail(key), 'Failed to load ' + key)
      end
   end

   def test_getAllStaticCodelists
      assert_instance_of(Hash, ADIWG::Mdcodes.getAllStaticCodelists)
   end

   def test_getStaticCodelist
      yaml = ADIWG::Mdcodes.getAllStaticCodelists
      refute_empty(yaml)

      yaml.keys.each do |key|
         assert_instance_of(Hash, ADIWG::Mdcodes.getStaticCodelist(key), 'Failed to load ' + key)
      end
   end

   def test_getStaticCodelist_deprecated
      yaml = ADIWG::Mdcodes.getStaticCodelist('iso_associationType')
      yamlDeprecated = ADIWG::Mdcodes.getStaticCodelist('iso_associationType', 'hash', true)

      refute_empty yaml['iso_associationType']
      refute_empty yamlDeprecated['iso_associationType']
      assert (yaml['iso_associationType'].length < yamlDeprecated['iso_associationType'].length)
   end

   def test_getAllCodelistsDetail_deprecated
      yaml = ADIWG::Mdcodes.getAllCodelistsDetail
      yamlDeprecated = ADIWG::Mdcodes.getAllCodelistsDetail('hash', true)

      refute_empty yaml['iso_associationType']['codelist']
      refute_empty yamlDeprecated['iso_associationType']['codelist']
      assert (yaml['iso_associationType']['codelist'].length < yamlDeprecated['iso_associationType']['codelist'].length)
   end

end
