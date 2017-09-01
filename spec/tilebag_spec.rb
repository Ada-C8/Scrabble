require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../lib/tilebag'
# require_relative 'wave-1-game.rb'

describe "TileBag" do
  describe "#initialize" do
    it "Should create instance of the Tilebag" do
      tilebag = Scrabble::TileBag.new
      tilebag.must_be_kind_of Scrabble::TileBag
    end

    it "Should create a collection default tiles" do
      tilebag = Scrabble::TileBag.new
      tilebag.tiles_remaining.must_equal 98
    end

  end

  describe "#draw_tiles method" do
    it " " do
    end
  end


  describe "#tiles_remaining" do
    it "should return amount of tiles in the bag" do
      tilebag = Scrabble::TileBag.new
      tilebag.tiles_remaining.must_equal 98
    end

    it "should remain correct after tiles are drawn" do
      tilebag = Scrabble::TileBag.new
      tile_count = tilebag.tiles_remaining
      tilebag.draw_tiles(5)
      tilebag.tiles_remaining.must_equal (tile_count - 5)
    end
  end
end
