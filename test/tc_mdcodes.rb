=begin
* Description: Test Mdcodes methods
* Author: Josh Bradley
* Date: 2014-11-07
* License: Public Domain
=end

require 'minitest/autorun'
require File.join(File.dirname(__FILE__),'..','lib', 'adiwg-mdcodes.rb')

class TestMdcodes < MiniTest::Unit::TestCase
    def test_yaml
        assert_silent {
            yaml = YAML.load_file(ADIWG::Mdcodes.getYamlPath)
            assert_instance_of(Hash, yaml, failure_message = 'Could not parse YAML.')
        }
    end

    def test_getCodeLists
        assert_instance_of(Hash,ADIWG::Mdcodes.getCodeLists)
    end

    def test_getCodeList
        yaml = ADIWG::Mdcodes.getCodeLists
        key = yaml.keys[0]
        assert_instance_of(Hash,ADIWG::Mdcodes.getCodeList(key))
    end

    def test_getCodeNames
        assert_instance_of(Hash,ADIWG::Mdcodes.getCodeNames)
    end

    def test_getCodeName
        yaml = ADIWG::Mdcodes.getCodeLists
        key = yaml.keys[0]
        assert_instance_of(Hash,ADIWG::Mdcodes.getCodeName(key))
    end
end