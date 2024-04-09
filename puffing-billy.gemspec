# -*- encoding: utf-8 -*-
require File.expand_path('../lib/billy/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Olly Smith']
  gem.email         = ['olly.smith@gmail.com']
  gem.description   = 'A stubbing proxy server for ruby. Connect it to your browser in integration tests to fake interactions with remote HTTP(S) servers.'
  gem.summary       = 'Easy request stubs for browser tests.'
  gem.homepage      = 'https://github.com/oesmith/puffing-billy'

  gem.files         = %w[LICENSE CHANGELOG.md README.md] + Dir['lib/**/*.rb'] + Dir['lib/**/*.rake']
  gem.name          = 'puffing-billy'
  gem.require_paths = ['lib']
  gem.version       = Billy::VERSION
  gem.required_ruby_version = '>= 2.7.0'
  gem.license       = 'MIT'

  gem.add_development_dependency 'rspec', '~> 3.13'
  gem.add_development_dependency 'thin', '~> 1.8.2'
  gem.add_development_dependency 'rack', '~> 2.2.9'
  gem.add_development_dependency 'faraday', '>= 0.9.0'
  gem.add_development_dependency 'apparition', '>= 0.6.0'
  gem.add_development_dependency 'capybara', '>= 3.0.0'
  gem.add_development_dependency 'selenium-webdriver', '>= 4.0.0'
  gem.add_development_dependency 'guard', '~> 2.18.1'
  gem.add_development_dependency 'rb-inotify', '~> 0.10.1'
  gem.add_development_dependency 'pry', '~> 0.14.2'
  gem.add_development_dependency 'cucumber', '~> 9.2.0'
  gem.add_development_dependency 'watir', '~> 7.3.0'
  gem.add_development_dependency 'webrick', '~> 1.8'
  gem.add_development_dependency 'activesupport', '~> 7.0.0'
  gem.add_runtime_dependency 'addressable', '~> 2.5'
  gem.add_runtime_dependency 'eventmachine', '~> 1.2'
  gem.add_runtime_dependency 'em-synchrony'
  gem.add_runtime_dependency 'em-http-request', '~> 1.1', '>= 1.1.0'
  gem.add_runtime_dependency 'eventmachine_httpserver'
  gem.add_runtime_dependency 'http_parser.rb', '~> 0.6.0'
  gem.add_runtime_dependency 'multi_json'
end
