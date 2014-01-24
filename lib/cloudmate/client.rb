require 'cloudmate/configuration'
require 'cloudmate/connection'

module Cloudmate
  class Client
    attr_reader :config

    def initialize(options={})
      @config = Configuration.new(options)
    end

    def configure
      yield config
    end

    def connection
      @connection ||= Connection.new
    end

    def geocode(options)
      url = "http://beta.geocoding.cloudmade.com/v3/#{config.api_key}/api/geo.location.search.2"

      options.each do |name, value|
        if value.respond_to?(:join)
          options[name] = value.join(';')
        elsif value.kind_of?(Hash)
          options[name] = value.map { |k, v| "[#{k}=#{v}]" }.join
        end
      end

      options[:format] = 'json'

      options[:source] ||= 'OSM'
      options[:enc]    ||= 'UTF-8'
      options[:limit]  ||= 10

      connection.request(:get, url, options)
    end

    def route(options)
      points = options.delete(:points)
      route_type = options.delete(:type) { 'car' }
      route_type_modifier = options.delete(:type_modifier)

      coords = points[1..-2].flatten.join(',')
      coords = [points.first, coords.empty? ? nil : "%5B#{coords}%5D", points.last].compact.flatten.join(',')

      url = "http://routes.cloudmade.com/#{config.api_key}/api/0.3"
      url = [url, coords, route_type, route_type_modifier].compact.join('/')
      url << '.js'

      connection.request(:get, url, options)
    end
  end
end
