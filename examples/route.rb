require 'cloudmate'

Cloudmate.configure do |config|
  config.api_key = '8ee2a50541944fb9bcedded5165f09d9' # Test API key taken from the official docs
end

p Cloudmate.route(points: [[47.25976, 9.58423], [47.26117, 9.59882]], type: :bicycle)
