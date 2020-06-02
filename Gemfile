# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'sinatra'
gem 'figaro', :git => 'https://github.com/bpaquet/figaro.git', :branch => 'sinatra'
gem 'faraday'

group :development, :test do
  gem 'rake'
  gem 'pry'
  gem 'shotgun'
  gem 'fast_jsonapi'
  gem 'rack-test'
  gem 'rspec'
  gem 'capybara'
  gem 'launchy'
end
# gem "rails"
