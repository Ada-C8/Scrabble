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
      tilebag.remaining_tiles.must_be_kind_of Hash
      (tilebag.remaining_tiles.length > 0).must_equal true
    end

  end

  describe "#draw_tiles method" do
    it "Should make sure a max of 7 tiles drawn" do
		tilebag = Scrabble::TileBag.new
		tilebag.draw_tiles(5)
		count = tilebag.tiles_remaining
		count.must_equal 93
    end
  end


  describe "#tiles_remaining" do
    it "should return amount of tiles in the bag" do
      tilebag = Scrabble::TileBag.new
	  sum = 0
	  tilebag.remaining_tiles.each do |key, value|
		sum += value
	  end
      tilebag.tiles_remaining.must_equal 98
    end

    it "should remain correct after tiles are drawn" do
      tilebag = Scrabble::TileBag.new
      tilebag.draw_tiles(5)
      tilebag.tiles_remaining.must_equal 93
    end
  end
end
