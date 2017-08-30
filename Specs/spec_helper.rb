
require 'SimpleCov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require 'pry'

require_relative '../lib/Player.rb'
require_relative '../lib/Scoring.rb'

require_relative '../lib/TileBag.rb'
