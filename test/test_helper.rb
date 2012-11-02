require 'minitest/autorun'
require 'minitest/unit'
require 'webmock/minitest'

require 'cloudmate'

module Cloudmate
  module TestHelper
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
