require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'
require_relative '../lib/scrabble-scoring.rb'



Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
