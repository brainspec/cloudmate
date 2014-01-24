require 'cloudmate'

Cloudmate.configure do |config|
  config.api_key = '8ee2a50541944fb9bcedded5165f09d9' # Test API key taken from the official docs
end

# Free form address search
p Cloudmate.geocode(q: 'Leinfelden-Echterdingen Germany Karlstr. 12')

# Structured address search
p Cloudmate.geocode(q: { country: 'Germany', street: 'Karlstr.', city: 'Leinfelden-Echterdingen', zip: '70771', housenumber: '12' })

# Reverse geocoding
p Cloudmate.geocode(q: [48.77615073, 9.16416465])
