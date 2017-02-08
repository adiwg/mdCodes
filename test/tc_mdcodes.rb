=begin
* Description: Test Mdcodes methods
* Author: Josh Bradley
* Date: 2014-11-07
* License: Public Domain
=end

require 'minitest/autorun'
require File.join(File.dirname(__FILE__),'..','lib', 'adiwg-mdcodes.rb')

class TestMdcodes < Minitest::Test
  def test_parseYaml
    @errors = Array.new

    FileList[ADIWG::Mdcodes.getYamlPath + '**/*.yml'].each do |fname|
      begin YAML.load_file(fname)
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

  def test_getAllCodeistsDetail
    assert_instance_of(Hash,ADIWG::Mdcodes.getAllCodeistsDetail)
  end

  def test_getCodelistDetail
    yaml = ADIWG::Mdcodes.getAllCodeistsDetail
    refute_empty(yaml)
    key = yaml.keys[0]
    p key
    assert_instance_of(Hash,ADIWG::Mdcodes.getCodelistDetail(key))
  end

  def test_getAllStaticCodelists
    assert_instance_of(Hash,ADIWG::Mdcodes.getAllStaticCodelists)
  end

  def test_getStaticCodelist
    yaml = ADIWG::Mdcodes.getAllStaticCodelists
    refute_empty(yaml)
    key = yaml.keys[0]
    p key
    assert_instance_of(Hash,ADIWG::Mdcodes.getStaticCodelist(key))
  end
end
