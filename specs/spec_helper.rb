# require 'simplecov'
# SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../lib/scoring'
require_relative '../lib/player'
# require_relative '../lib/wave-2-game'
# require_relative '../lib/wave-3-game'






Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
