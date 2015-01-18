source 'http://rubygems.org'
gem 'kaminari'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use sqlite3 as the database for Active Record

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

## Yelp api integration with ruby
gem 'yelp', require: 'yelp'

gem 'httparty'
gem 'certified'
gem 'scrapix'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'debugger' anywhere in the code to stop execution and get a debugger console
  gem 'debugger'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
end

gem 'responders', '~> 2.0' 
gem 'wolfram'

# Use Unicorn
platforms :ruby do gem 'unicorn' end
	
group :development do
  # Use Capistrano for deployment
  gem 'capistrano', '3.1.0'
  gem 'capistrano-rails', '~> 1.1.1'
  gem 'capistrano-bundler'
  gem 'capistrano-rbenv', '~> 2.0'
  gem 'capistrano-unicorn-nginx', '~> 2.0'
  gem 'capistrano-postgresql', '~> 3.0'

  gem 'sqlite3'
end

group :production do
  gem 'pg'

end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
#if RUBY_PLATFORM=~ /win32/ 
	gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
#end
