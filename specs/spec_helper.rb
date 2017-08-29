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


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
