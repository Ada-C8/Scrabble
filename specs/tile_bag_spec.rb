require_relative 'spec_helper'

describe "TileBag class" do

  describe "initialize" do

    it "creates a new TileBag with a hash of letters and their quantities" do
      new_tile_bag = Scrabble::TileBag.new
      new_tile_bag.must_be_instance_of Scrabble::TileBag
      new_tile_bag.tiles.must_equal Scrabble::TileBag::LETTER_FREQUENCY
    end
  end

  describe "draw_tiles method" do
    before do
      @new_tile_bag = Scrabble::TileBag.new
    end

    it "Returns a collection of random tiles " do
      tiles1 = @new_tile_bag.draw_tiles(7)
      tiles2 = @new_tile_bag.draw_tiles(7)
      tiles3 = @new_tile_bag.draw_tiles(7)

      tiles1.must_be_kind_of Array
      tiles1.length.must_equal 7

      tiles1.wont_equal (tiles2 || tiles3) #as good as random is going to get

    end

    it "Removes the tiles from Tile Bag" do

    end

  end
end
