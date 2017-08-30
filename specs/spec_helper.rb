require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'
require 'simplecov'
SimpleCov.start


require_relative '../lib/scrabble'
require_relative '../lib/player'


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
