# specs/spec_helper.rb
require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'
require 'minitest/skip_dsl'
require 'pry'


# Require any classes
require_relative '../lib/scoring'
require_relative '../lib/player'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
