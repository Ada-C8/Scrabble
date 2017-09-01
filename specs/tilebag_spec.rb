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
end #end of scoring
