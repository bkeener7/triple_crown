source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.4'

# Core Gems
gem 'bootsnap', '>= 1.1.0', require: false # Reduces boot times through caching
gem 'coffee-rails', '~> 4.2' # Use CoffeeScript for .coffee assets and views
gem 'jbuilder', '~> 2.5' # Build JSON APIs
gem 'pg', '>= 0.18', '< 2.0' # Use postgresql as the database for Active Record
gem 'puma', '~> 4.3' # Use Puma as the app server
gem 'rails', '~> 5.2.8', '>= 5.2.8.1'
gem 'sass-rails', '~> 5.0' # Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0' # Use Uglifier as compressor for JavaScript assets

# Group :development and :test
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara'
  gem 'launchy' # save_and_open_page
  gem 'orderly'
  gem 'pry'
  gem 'rspec-rails'
  gem 'shoulda-matchers', '~> 5.0'
  gem 'simplecov'
end

# Group :development
group :development do
  gem 'listen', '>= 3.0.5', '< 3.2' # Access an interactive console
  gem 'pry-rails'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'web-console', '>= 3.3.0'
end

# Platform-specific gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Uncomment these gems if you want to use them:
# gem 'mini_racer', platforms: :ruby # For ExecJS
# gem 'redis', '~> 4.0'               # Use Redis for Action Cable in production
# gem 'bcrypt', '~> 3.1.7'           # Use ActiveModel has_secure_password
# gem 'mini_magick', '~> 4.8'        # Use ActiveStorage variant
# gem 'capistrano-rails', group: :development # Use Capistrano for deployment
