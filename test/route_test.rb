require 'test_helper'

module Cloudmate
  class RouteTest < MiniTest::Unit::TestCase
    include TestHelper

    def test_route
      stub_request(:get, 'http://routes.cloudmade.com/TEST_API_KEY/api/0.3/47.25976,9.58423,47.26117,9.59882/car/shortest.js').
        to_return(status: 200, body: fixture(:route))

      result = client.route(points: [[47.25976, 9.58423], [47.26117, 9.59882]], type: :car, type_modifier: :shortest)
      assert_equal 1603, result['route_summary']['total_distance']
    end

    def test_route_transit
      stub_request(:get, 'http://routes.cloudmade.com/TEST_API_KEY/api/0.3/51.22545,4.4073,%5B51.22,4.41,51.2,4.41%5D,51.23,4.42/car.js?units=miles').
        to_return(status: 200, body: fixture(:route_transit))

      result = client.route(points: [[51.22545, 4.40730], [51.22, 4.41], [51.2, 4.41], [51.23, 4.42]], type: :car, units: :miles)
      assert_equal 9185, result['route_summary']['total_distance']
    end
  end
end
