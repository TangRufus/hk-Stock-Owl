source 'https://rubygems.org'

## Ruby version
### Update .ruby-version as well
ruby "2.1.5"

## Default gems

gem 'rails',                    '4.2.0.beta4'
### rails 4.2 beta4
gem 'sass-rails',               '~> 5.0.0.beta1'
### rails 4.2 beta4 - ActiveAdmin
gem 'inherited_resources',      github: 'codecraft63/inherited_resources'


# Use postgresql as the database for Active Record
gem 'pg'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier',                 '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails',             '~> 4.1.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder',                 '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc',                     '~> 0.4.0',   group: :doc

# Use unicorn as the app server
gem 'unicorn',                  '~> 4.8.3'

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',                                 group: :development


# hkStockOwl gems

## Debugging
gem 'binding_of_caller',        '~> 0.7.2',   group: :development
gem 'better_errors',            '~> 2.0.0',   group: :development
gem 'did_you_mean',             '~> 0.9.0',   group: :development
gem 'annotate',                 '~> 2.6.5',   group: :development
gem 'rubocop',                  '~> 0.27.1',  group: :development,  require: false
gem 'brakeman',                 '~> 2.6.3',   group: :development,  require: false
### run `gem install mailcatcher` yourself
### see http://mailcatcher.me/#bundler

## Production
gem 'rails_12factor',           '~> 0.0.3',   group: :production

## All envirments
# For worker management
gem 'foreman',                  '~> 0.75.0'
# Membership
gem 'devise',                   '~> 3.4.0'
# CMS
gem 'activeadmin',              github: 'gregbell/active_admin'
# Theme
gem 'bootstrap-sass',           '~> 3.3.1.0'
gem 'autoprefixer-rails',       '~> 4.0.0.1'
gem 'font-awesome-sass',        '~> 4.2.2'
# Form generation
gem 'simple_form',              '~> 3.0.2'
# For modeling
gem 'auto_strip_attributes',    '~> 2.0.6'
# Scraping HTML
gem 'nokogiri',                 '~> 1.6.4'
# Background Job
gem 'resque',                   '~> 1.25.2',  :require => 'resque/server'
gem 'devise-async',             '~> 0.9.0'
# URL Shortener
gem 'bitly',                    '~> 0.10.3'
# Performance monitor
gem 'newrelic_rpm',             '~> 3.9.7.266'
