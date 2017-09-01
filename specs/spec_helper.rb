require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../lib/scoring.rb'
require_relative '../lib/player.rb'
require_relative '../lib/tilebag.rb'
require_relative '../lib/dictionary.rb'
# require_relative '../lib/dictionary.txt'





Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
