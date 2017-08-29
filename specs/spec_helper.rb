require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scoring'


reporter_options = { color:true}
Minitest::Reporters.use! Minitest::Reporters::DefaultReporter.new(reporter_options)
