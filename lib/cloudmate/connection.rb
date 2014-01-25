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
        request.options[:timeout]      = 2
        request.options[:open_timeout] = 1
      end

      response.body
    end
  end
end
