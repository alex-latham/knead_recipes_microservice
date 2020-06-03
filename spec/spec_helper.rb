ENV['RACK_ENV'] = 'test'
require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'rack/test'
require 'sinatra'
require 'faraday'
