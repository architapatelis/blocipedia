source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'

# specify database for Production environment
# heroku only supports Postgres, so we use 'pg'
group :production do
   gem 'pg'
   gem 'rails_12factor'
 end

 group :development do
    # Use sqlite3 as the database for Active Record
    gem 'sqlite3'

    # Access an IRB console on exception pages or by using <%= console %> in views
    gem 'web-console', '~> 2.0'
  end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster.
gem 'turbolinks'
#Sass-powered version of Bootstrap
gem 'bootstrap-sass'
# to store SendGrid username and password as environment variables.
gem 'figaro'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Spring speeds up development by keeping your application running in the background.
  gem 'spring'
  # testing framework
  gem 'rspec-rails', '~> 3.0'
  # to write association tests for 'topics' and 'posts' - provides methods not found in RSpec
  gem 'shoulda'
  # used to easily generate fake data: names, addresses, phone numbers, etc.
  gem 'faker'
  # allows us to build objects we can use for testing.
  #Factories allow us to modify the behavior of a given object type in a single place.
  gem 'factory_girl_rails'
  # use Pry as your rails console
  gem 'pry-rails'
end
