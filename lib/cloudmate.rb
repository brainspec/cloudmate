require 'cloudmate/version'
require 'cloudmate/client'

module Cloudmate
  extend SingleForwardable

  def_delegators :client, :configure, :geocode, :route

  def self.client
    @client ||= Client.new
  end
end
