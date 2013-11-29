source 'https://rubygems.org'
ruby '1.9.3'

gem 'rails', '4.0.0'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'bootstrap-sass', github: 'thomas-mcdonald/bootstrap-sass', branch: '3'
gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'
gem 'devise', '~> 3.1.1'
gem 'debugger'
group :development, :test do
	gem 'sqlite3'
	gem 'mysql2'
end
group :assets do
 # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby
end
group :production do
	gem 'pg'
end
group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end
