require 'test_helper'

module Cloudmate
  class GeocodeTest < MiniTest::Unit::TestCase
    include TestHelper

    def test_query
      stub_request(:get, 'http://beta.geocoding.cloudmade.com/v3/TEST_API_KEY/api/geo.location.search.2?format=json&source=OSM&enc=UTF-8&limit=10&q=Leinfelden-Echterdingen%20Germany%20Karlstr.%2012').
        to_return(status: 200, body: fixture(:geocode_query))

      result = client.geocode(q: 'Leinfelden-Echterdingen Germany Karlstr. 12')
      assert result['status']['success']
    end

    def test_query_structured
      stub_request(:get, 'http://beta.geocoding.cloudmade.com/v3/TEST_API_KEY/api/geo.location.search.2?format=json&source=OSM&enc=UTF-8&limit=10&q=[country=Germany][street=Karlstr.][city=Leinfelden-Echterdingen][zip=70771][housenumber=12]').
        to_return(status: 200, body: fixture(:geocode_query_structured))

      result = client.geocode(q: { country: 'Germany', street: 'Karlstr.', city: 'Leinfelden-Echterdingen', zip: '70771', housenumber: '12' })
      assert result['status']['success']
    end

    def test_reverse
      stub_request(:get, 'http://beta.geocoding.cloudmade.com/v3/TEST_API_KEY/api/geo.location.search.2?format=json&source=OSM&enc=UTF-8&limit=10&q=48.77615073;9.16416465').
        to_return(status: 200, body: fixture(:geocode_reverse))

      result = client.geocode(q: [48.77615073, 9.16416465])
      assert result['status']['success']
    end
  end
end
