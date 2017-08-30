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
    it "returns an array with the correct number of tiles" do
      game = Scrabble::TileBag.new
      num = 7
      game.draw_tiles(num).must_be_instance_of Array
      game.draw_tiles(num).length.must_equal num
    end

    it "can not draw more tiles than are available for each letter" do
      game = game = Scrabble::TileBag.new
      num = 99
      proc{game.draw_tiles(num)}.must_raise Exception
    end
  end

  describe "tiles_remaining" do
    it "returns an integer" do
      game = Scrabble::TileBag.new
      game.tiles_remaining.must_be_instance_of Integer
    end

    it "returns the accurate number of remaining tiles" do
      game = Scrabble::TileBag.new
      game.tiles_remaining.must_equal 98
      game.draw_tiles(7)
      game.tiles_remaining.must_equal 91
      game.draw_tiles(91)
      game.tiles_remaining.must_equal 0
      proc{game.draw_tiles(1)}.must_raise Exception
    end
  end

end
