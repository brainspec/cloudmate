require 'test_helper'

module Cloudmate
  class ConfigurationTest < MiniTest::Unit::TestCase
    def test_options
      config = Configuration.new(api_key: 'TEST_API_KEY')
      assert_equal 'TEST_API_KEY', config.api_key
    end
  end
end
