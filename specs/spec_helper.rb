# specs/spec_helper.rb
require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require 'simplecov'
SimpleCov.start

# Require any classes
# ex require_relative 'lib/foo.rb'
require_relative '../lib/scoring.rb'

# Uncomment below as you go through the waves
# require_relative '../wave-1-game.rb'
# require_relative '../wave-2-game.rb'
# require_relative '../wave-3-game.rb'


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
