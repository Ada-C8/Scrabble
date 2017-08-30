# SimpleCov needs to be FIRST THING in spec helper
require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scoring'
require_relative '../lib/player'

reporter_options = { color:true}
# Minitest::Reporters.use! Minitest::Reporters::DefaultReporter.new(reporter_options)
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new(reporter_options)
