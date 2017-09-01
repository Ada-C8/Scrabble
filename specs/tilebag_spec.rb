require_relative 'spec_helper'

describe "Tilebag Class" do
  before do
    @bag = Scrabble::Tilebag.new
  end
  describe "initialize" do
    it "Scrabble::Tilebag responds to tile_bag instance variable" do
      @bag.must_respond_to :tile_bag
    end
    it "Tile bag is an array" do
      @bag.tile_bag.must_be_kind_of Array
    end
  end
  describe "Draw Tiles Method" do
    # before do
    #   @bag.draw_tiles(7, [])
    # end
    it "Scrabble::Tilebag responds to draw_tiles method" do
      @bag.must_respond_to :draw_tiles
    end
    it "Returns a collection of tiles" do
      @bag.draw_tiles(7).must_be_kind_of Array
    end
    it "Removes the tiles from the default set" do
      # Tile bag starts with 98. Remove 7 and you should have 91 left
      @bag.draw_tiles(7)
      @bag.tiles_remaining.must_equal 91
    end
  end
end
