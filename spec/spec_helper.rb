require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/reporters'


require 'simplecov'
SimpleCov.start

#require any classes
require_relative '../lib/scoring'
require_relative '../lib/player'
require_relative '../lib/tile_bag'



Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
