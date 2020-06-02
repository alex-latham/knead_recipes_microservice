require 'rubygems'
require 'bundler'
require 'figaro/sinatra'

Bundler.require

require_relative './app/controllers/recipes_controller'
run RecipesController
