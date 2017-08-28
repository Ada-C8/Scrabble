require 'minitest/autorun'
require 'minitest/reporters'
require_relative '..lib/scoring.rb'
require_relative 'wave-1-game.rb'
# require_relative 'specs/scoring_spec'
#require_relative '../lib/deck'



Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
