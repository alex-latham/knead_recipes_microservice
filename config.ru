require 'rubygems'
require 'bundler'

Bundler.require

require_relative './app/controllers/recipes_controller'
run RecipesController
