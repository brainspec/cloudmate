require 'test_helper'

module Cloudmate
  class DelegationTest < MiniTest::Unit::TestCase
    def test_delegation
      mock = MiniTest::Mock.new
      mock.expect(:geocode, :result, [{ query: 'Test query' }])

      Cloudmate.stub(:client, mock) do
        assert_equal :result, Cloudmate.geocode(query: 'Test query')
      end

      mock.verify
    end
  end
end
