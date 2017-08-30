require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require 'simplecov'
SimpleCov.start

# Require any classes
# ex require_relative 'lib/foo.rb'
require_relative '../lib/player.rb'
require_relative '../lib/scrabble.rb'


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
