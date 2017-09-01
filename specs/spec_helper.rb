require 'simplecov'
SimpleCov.start
require 'csv'
require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/scoring.rb'
require_relative '../lib/player.rb'
require_relative '../lib/tilebag.rb'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
