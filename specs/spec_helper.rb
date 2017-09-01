require 'simplecov'
SimpleCov.start

require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'
require 'minitest/skip_dsl'

# Require any classes
# ex require_relative 'lib/foo.rb'
require_relative '../lib/scoring'
require_relative '../lib/player'
require_relative '../lib/tilebag'


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
