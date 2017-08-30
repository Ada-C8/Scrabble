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
      @tiles1 = @new_tile_bag.draw_tiles(7)
      @tiles2 = @new_tile_bag.draw_tiles(7)
      @tiles3 = @new_tile_bag.draw_tiles(7)
    end

    it "Returns a collection of random tiles " do
      @tiles1.must_be_kind_of Array
      @tiles1.length.must_equal 7

      @tiles1.wont_equal (@tiles2 || @tiles3) #as good as random is going to get

    end

    it "Removes the tiles from Tile Bag" do
      @new_tile_bag.tiles.values.sum.must_equal (Scrabble::TileBag::LETTER_FREQUENCY.values.sum - 21)
    end

    it "Won't pick more than 4 Ds and 1 Z when all tiles are picked" do
      new_bag = Scrabble::TileBag.new

      test_hand = new_bag.draw_tiles(98)
      test_hand.count('D').must_equal 4
      test_hand.count('Z').must_equal 1
    end

  end

  describe "tiles_remaining method" do
      it "Returns the number of tiles left in the tile bag" do
        new_bag = Scrabble::TileBag.new

        new_bag.draw_tiles(10)
        new_bag.tiles_remaining.must_equal 88

        new_bag.draw_tiles(88)
        new_bag.tiles_remaining.must_equal 0
      end
  end

end
