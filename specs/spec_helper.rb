require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/Scoring'
require_relative '../lib/Player'
require_relative '../lib/TileBag'
require_relative '../lib/Dictionary'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
