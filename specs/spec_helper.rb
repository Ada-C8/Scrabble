require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'



require_relative '../lib/scrabble'
require_relative '../lib/player'


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
