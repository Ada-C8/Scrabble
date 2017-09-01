require_relative 'spec_helper'

describe "TileBag" do
  describe "Initialize" do
    it "initializes with the appropriate number of each tile" do
      starting_tiles = Scrabble::TileBag.new.available_tiles

      starting_tiles.values.sum.must_equal 98 #total number of tiles
      starting_tiles["a"].must_equal 9
      starting_tiles["z"].must_equal 1
      starting_tiles["o"].must_equal 8
    end
  end

  describe "draw_tiles(num)" do
    before do
      @game = Scrabble::TileBag.new
    end
    it "returns an array with the correct number of tiles" do
      num = 7
      @game.draw_tiles(num).must_be_instance_of Array
      @game.draw_tiles(num).length.must_equal num
    end

    it "can not draw more tiles than are available for each letter" do
      num = 99
      @game.draw_tiles(num).length < num
    end
  end

  describe "tiles_remaining" do
    before do
      @game = Scrabble::TileBag.new
    end
    it "returns an integer" do
      @game.tiles_remaining.must_be_instance_of Integer
    end

    it "returns the accurate number of remaining tiles" do
      @game.tiles_remaining.must_equal 98
      @game.draw_tiles(7)
      @game.tiles_remaining.must_equal 91
      @game.draw_tiles(91)
      @game.tiles_remaining.must_equal 0
      @game.draw_tiles(1).must_equal []
    end
  end

end
