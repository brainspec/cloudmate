require 'test_helper'

module Cloudmate
  class GeocodeTest < MiniTest::Unit::TestCase
    def test_query
      stub_request(:get, 'http://geocoding.cloudmade.com/TEST_API_KEY/geocoding/v2/find.js?query=133%20Fleet%20street,%20London,%20UK').
        to_return(status: 200, body: fixture(:geocode_query))

      result = client.geocode(query: '133 Fleet street, London, UK')
      assert_equal 2, result['found']
    end

    def test_around
      stub_request(:get, 'http://geocoding.cloudmade.com/TEST_API_KEY/geocoding/v2/find.js?around=51.51558,-0.141449').
        to_return(status: 200, body: fixture(:geocode_around))

      result = client.geocode(around: [51.51558, -0.141449])
      assert_equal 9, result['found']
    end

    private

    def client
      client = Cloudmate::Client.new
      client.configure do |config|
        config.api_key = 'TEST_API_KEY'
      end

      client
    end

    def fixture(name)
      File.read(File.expand_path("../fixtures/#{name}.json", __FILE__))
    end
  end
end
