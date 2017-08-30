require "simplecov"
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scrabble.rb'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
