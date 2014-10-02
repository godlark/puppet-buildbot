source ENV['GEM_SOURCE'] || 'https://rubygems.org'

gem 'rake'
gem 'puppetlabs_spec_helper'
gem 'puppet-lint'

if puppetversion = ENV['PUPPET_VERSION']
  gem 'puppet', puppetversion
else
  gem 'puppet'
end
