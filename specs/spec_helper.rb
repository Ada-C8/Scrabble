require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scoring'
require_relative '../lib/player'


reporter_options = { color:true}
Minitest::Reporters.use! Minitest::Reporters::DefaultReporter.new(reporter_options)
