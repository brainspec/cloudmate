require 'faraday'
require 'faraday_middleware'

module Cloudmate
  class Connection
    def initialize
      @faraday = Faraday.new do |faraday|
        faraday.response :json
        faraday.adapter  Faraday.default_adapter
      end
    end

    def request(method, url, options={})
      response = @faraday.public_send(method) do |request|
        request.url(url, options)
        yield request if block_given?
      end

      response.body
    end
  end
end
