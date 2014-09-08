source ENV['GEM_SOURCE'] || 'https://rubygems.org'

gem 'rake'
gem 'puppet-lint'
gem 'rspec-puppet'

if puppetversion = ENV['PUPPET_VERSION']
  gem 'puppet', puppetversion
else
  gem 'puppet'
end
