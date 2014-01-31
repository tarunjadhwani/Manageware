source 'https://rubygems.org'
ruby '1.9.3'

gem 'rails', '4.0.2'
gem 'bootstrap-sass', '2.3.2'
gem 'bcrypt-ruby', '3.1.2'
gem 'bootstrap-datepicker-rails'
gem "numbers_and_words", "~> 0.10.0"
gem 'wkhtmltopdf-binary'
gem 'wicked_pdf'
gem 'sqlite3', '1.3.7'

group :development do
  gem 'capistrano', '2.5.4'
end

group :development, :test do
	gem 'rspec-rails', '2.13.0'
	gem 'guard-rspec', '2.5.0'
	gem 'guard-spork', '1.5.0'
end

group :test do
#  gem 'capybara', github: 'jnicklas/capybara'
end

group :assets do
  gem 'sass-rails',   '4.0.0.beta1'
  gem 'coffee-rails', '4.0.1'
  gem 'uglifier', '1.0.3'
end

gem 'jquery-rails', '2.2.1'
gem 'turbolinks', '1.0.0'
gem 'jbuilder', '1.0.1'

group :doc do
  gem 'sdoc', require: false
end

group :production do
    #gem 'pg'
    #gem 'mysql2'
    gem 'rails_12factor', '0.0.2'
end