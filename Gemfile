source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.1'
# Use sqlite3 as the database for Active Record
#gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.11'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

#Simple wrapper around IZITOAST js notification plugin
#gem 'izitoast', '~> 1.2'

#jQuery UI's JavaScript, CSS, and image files packaged for the Rails 3.1+ asset pipeline
#gem 'jquery-ui-rails'

#Simple HTTP and REST client for Ruby, inspired by microframework syntax for specifying actions
gem 'rest-client'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

#The most popular HTML, CSS, and JavaScript framework for developing responsive, mobile first projects on the web
gem 'bootstrap', '~> 4.0.0.alpha6'

#bootstrap-sass is a Sass-powered version of Bootstrap 3, ready to drop right into your Sass powered applications.
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'

#Pg is the Ruby interface to the {PostgreSQL RDBMS}
gem 'pg', '~> 1.0'

#Flexible authentication solution for Rails with Warden
gem 'devise', '~> 4.4', '>= 4.4.3'

#Util library with awesome fonts
gem 'font-awesome-rails', '~> 4.7.0.2'

#bootstrap-timepicker-rails project integrates Timepicker with Rails 3 assets pipeline.
gem 'bootstrap-timepicker-rails'

#Great Ruby dubugging companion: pretty print Ruby objects to visualize their structure. Supports custom object formatting via plugins
gem 'awesome_print', '~> 1.8'

# Seedbank allows you to structure your Rails seed data instead of having it all dumped into one large file
gem "seedbank", '~> 0.3.0'

#Jquery, you know the drill
gem 'jquery-rails', '~> 4.3.1'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end


group :development do
  #Shim to load environment variables from .env into ENV in development.
  gem 'dotenv-rails', groups: [:development, :test]
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
