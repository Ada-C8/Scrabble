require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../lib/scoring'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
