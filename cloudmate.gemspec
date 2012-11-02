# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cloudmate/version'

Gem::Specification.new do |gem|
  gem.name          = 'cloudmate'
  gem.version       = Cloudmate::VERSION
  gem.authors       = ['Sergey Nartimov']
  gem.email         = ['team@brainspec.com']
  gem.description   = %q{CloudMade API ruby client library}
  gem.summary       = %q{CloudMade API ruby client library}
  gem.homepage      = ''

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'faraday', '~> 0.8.4'
  gem.add_dependency 'faraday_middleware', '~> 0.9.0'
  gem.add_development_dependency 'rake', '~> 0.9.2.2'
  gem.add_development_dependency 'minitest', '~> 4.1'
  gem.add_development_dependency 'webmock', '~> 1.8.11'
end
