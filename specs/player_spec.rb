require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require 'minitest/pride'
require_relative '../lib/player'

describe 'Scrabble' do
  describe 'Player' do
    it "requires a name" do
      player = Scrabble::Player.new("Ada")
      player.name.must_equal "Ada"
    end
  end
end
