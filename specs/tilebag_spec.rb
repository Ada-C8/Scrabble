require_relative 'spec_helper'

describe "Scoring" do
  describe "initialze" do

    it "create a new instance of tile bag hash" do
      tile_bag = Scrabble::TileBag.new
      tile_bag.bag_of_tiles.must_be_kind_of Hash
    end

    it "returns the correct quantity for the amount of tiles" do
      tile_bag = Scrabble::TileBag.new
      tile_bag.bag_of_tiles[:E].must_equal 12
    end
  end #end of initialize

  describe "#draw_tiles" do

    it "returns a collection of random tiles as an Array" do
      tile_bag = Scrabble::TileBag.new
      tile_bag.draw_tiles(4).must_be_kind_of Array
    end

    it "returns the correct number of tiles drawn in the array" do
      tile_bag = Scrabble::TileBag.new
      tile_bag.draw_tiles(4).length.must_equal 4
    end

    it "raise an error if requested number of tiles is not a number" do
      tile_bag = Scrabble::TileBag.new
      proc {
        tile_bag.draw_tiles("")
      }.must_raise ArgumentError
    end

  describe "#tiles_remaining" do

    it "reduce the number of tiles in the bag by the number drawn" do
      tile_bag = Scrabble::TileBag.new
      tile_bag.draw_tiles(4)
      tile_bag.tiles_remaining.must_equal 94
    end
  end


  end #end of draw tiles

end #end of scoring
