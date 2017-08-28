require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scrabble'



Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
