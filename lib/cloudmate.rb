require 'cloudmate/version'
require 'cloudmate/client'

module Cloudmate
  class << self
    extend Forwardable

    def_delegators :client, :configure, :geocode

    def client
      @client ||= Client.new
    end
  end
end
