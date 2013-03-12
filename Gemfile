source 'https://rubygems.org'

gem 'rails', '3.2.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
gem 'pg'
gem 'mail'
gem 'valid_email'
gem 'will_paginate'
gem "binding_of_caller"
gem 'newrelic_rpm'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
  gem "twitter-bootstrap-rails"
end

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem "better_errors"
  gem "therubyracer"
  gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
end  

group :test do
  gem 'guard-rspec'
  gem 'capybara'
  gem 'database_cleaner'
end

gem 'jquery-rails'
gem 'rb-fsevent', '~> 0.9.1'
gem 'growl'
gem 'activerecord-reputation-system', require: 'reputation_system'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
