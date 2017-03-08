require 'minitest/autorun'
require 'json'
require File.join(File.dirname(__FILE__), '..', 'lib', 'adiwg-mdcodes.rb')

class TestVersion < Minitest::Test
  def test_version
    package = JSON.load File.new(File.join(File.dirname(__FILE__), '..', 'package.json'))
p ADIWG::Mdcodes
    assert_equal(ADIWG::Mdcodes::VERSION, package['version'], 'Gem version and npm versions are not equal')
  end
end
