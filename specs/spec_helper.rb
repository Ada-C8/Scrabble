require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/Scoring'
require_relative '../lib/Player'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
