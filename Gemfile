source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
gem 'bootstrap-sass', '2.0.0'


gem 'bcrypt-ruby', '3.0.1'

gem 'faker', '1.0.1'

gem 'will_paginate', '>= 3.0.3'

gem 'bootstrap-will_paginate', '0.0.6'

gem 'selenium-webdriver', '~> 2.35.1'


# Use sqlite3 as the database for Active Record
group :development do
  gem 'sqlite3'
  gem 'annotate', '~> 2.4.1.beta'
  #gem 'guard'
end

group :assets do
  gem 'sass-rails', '~> 5.0'

  gem 'uglifier', '>= 1.3.0'

  gem 'coffee-rails', '~> 4.1.0'

end

gem 'jquery-rails'

group :test, :development do
  gem 'rspec-rails'
  #gem 'guard-rspec', '0.5.5'
  #gem 'guard-spork', '0.3.2'
  #gem 'spork', '0.9.0'
  gem 'pry-nav'
end

group :test do
  gem 'capybara', '1.1.2'
  gem 'factory_girl_rails', '1.4.0'
  gem 'cucumber-rails', '1.2.1', require: false
  gem 'database_cleaner', '0.7.0'
end


group :production do
  gem 'pg', '0.12.2'
end


# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
