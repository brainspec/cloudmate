# Cloudmate

CloudMade API ruby client library

## Installation

Add this line to your application's Gemfile:

    gem 'cloudmate'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cloudmate

## Usage

```ruby
Cloudmate.configure do |config|
  config.api_key = 'CLOUDMADE_API_KEY'
end
```

### Geocoding

http://developers.cloudmade.com/projects/show/geocoding-http-api

Free form address search:

```ruby
Cloudmate.geocode(q: 'Leinfelden-Echterdingen Germany Karlstr. 12')
```

Structured address search:

```ruby
Cloudmate.geocode(q: { country: 'Germany', street: 'Karlstr.', city: 'Leinfelden-Echterdingen', zip: '70771', housenumber: '12' })
```

Reverse geocoding:

```ruby
Cloudmate.geocode(q: [48.77615073, 9.16416465])
```

### Routing

http://developers.cloudmade.com/wiki/routing-http-api/Documentation

```ruby
Cloudmate.route(points: [[47.25976, 9.58423], [47.26117, 9.59882]], type: :bicycle)
```

## Contributing [![Build Status](https://secure.travis-ci.org/brainspec/cloudmate.png?branch=master)](https://next.travis-ci.org/brainspec/cloudmate)

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
