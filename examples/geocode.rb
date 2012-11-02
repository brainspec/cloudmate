require 'cloudmate'

Cloudmate.configure do |config|
  config.api_key = '8ee2a50541944fb9bcedded5165f09d9' # Test API key taken from the official docs
end

p Cloudmate.geocode(query: '133 Fleet street, London, UK')
p Cloudmate.geocode(object_type: 'cafe', around: [51.51558, -0.141449], distance: :closest)
