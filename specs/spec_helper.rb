require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

# require 'simplecov'
# SimpleCov.start

# require_relative '../lib/wave-1-game'
require_relative '../lib/wave-2-player'
# require_relative '../lib/wave-2-game'
# require_relative '../lib/wave-3-game'
#require_relative '../lib/wave-3-TileBag'
require_relative '../lib/wave-1-scoring'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
