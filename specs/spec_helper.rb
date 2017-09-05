require 'simplecov'
SimpleCov.start

require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new


# require_relative '../lib/wave-1-game'
# require_relative '../lib/wave-2-game'
# require_relative '../lib/wave-3-game'
require_relative '../lib/wave-3-TileBag'
require_relative '../lib/wave-1-scoring'
<<<<<<< HEAD
require_relative '../lib/board'
require_relative '../lib/wave-2-player'
# require_relative '../lib/dictionary'
=======
require_relative '../lib/wave-2-player'
>>>>>>> f64c4c99466aeff78c71181920a1bfaf381ee6c4

require_relative '../lib/dictionary'
