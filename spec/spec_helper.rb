require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/reporters'


require 'simplecov'
SimpleCov.start

#require any classes
require_relative '../lib/scoring'



Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new