source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use Active Storage variant
gem 'image_processing', '~> 1.2'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Devise is used to provide user authentication.
gem 'devise', '~> 4.7'
# Pundit is used to provide user authorization.
gem 'pundit', '~> 2.1'

# Hotwire, Turbo, and Stimulus provides live and reactive HTML over the wire through action cable.
gem 'turbo-rails', '~> 0.5'

# Paper Trail is used to track and store changes to models in the database.
gem 'paper_trail', '~> 11.1'

# Faraday is used to interact with remote RESTful APIs.
gem 'faraday', '~> 1.0'

group :development, :test do
  # RSpec is used as a testing framework, replacing Rail's default.
  gem 'rspec-rails', '~> 4.0.2'
  # Factory Bot is used to create test factories, replacing Rail's default.
  gem 'factory_bot_rails', '~> 6.1'

  # Rubocop, and its associated cops, are static Ruby code analyzers and code formatters.
  gem 'rubocop', '~> 1.7', require: false
  gem 'rubocop-rails', '~> 2.9', require: false
  gem 'rubocop-performance', '~> 1.9', require: false
  gem 'rubocop-rspec', '~> 2.1', require: false

  # Pry is a console and IRB alternative.
  gem 'pry', '~> 0.13'
  gem 'pry-rails', '~> 0.3'
  gem 'pry-byebug', '~> 3.9'
end

group :development do
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Annotate automatically adds a comment to the top of relevant classes based on its current database schema.
  gem 'annotate', '~> 3.1'
end

group :test do
  # Capybara is used to write and run tests using Javascript from a user's perspective.
  gem 'capybara', '~> 3.34'
  # Selenium Webdriver is a Javascript driver used by Capybara to render the tests.
  gem 'selenium-webdriver', '~> 3.142'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
