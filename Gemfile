# frozen_string_literal: true
source 'https://rubygems.org'
git_source(:github) { |_repo| 'https://github.com/#{repo}.git' }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.2', '>= 6.0.2.2'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  gem 'dotenv-rails', '~> 2.7'
  gem 'pry', '~> 0.13.0'
  gem 'pry-rails', '~> 0.3.9'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'rubocop', '~> 0.81.0'
  gem 'rubocop-rails', '~> 2.5'
  gem 'solargraph', '~> 0.38.6'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# The ruby implementation of the GraphQL language.
gem 'graphql', '~> 1.10'

# A development utility to test GraphQL queries.
gem 'graphiql-rails', '~> 1.7', group: :development
gem 'graphql-client', '~> 0.16.0'

gem 'nokogiri', '~> 1.10'
gem 'http', '~> 4.4'
gem 'jwt', '~> 2.2'
