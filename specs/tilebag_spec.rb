require_relative 'spec_helper'

describe "TileBag" do
  before do
    @tile_bag = Scrabble::TileBag.new
  end

  describe "initialze" do

    it "#initialize: should be an instance of TileBag class" do
      @tile_bag.class.must_equal Scrabble::TileBag #to call the class, you need to specify the namespace Scrabble::TileBag, not just TileBag
    end

    #it "create a new instance of tile bag hash" do
    it "#initialize: should contain a collection of all default tiles after initializing" do
      @tile_bag.bag_of_tiles.must_be_kind_of Hash
    end

    it "returns the correct quantity for the amount of tiles" do
      @tile_bag.bag_of_tiles[:E].must_equal 12
    end
  end#_of_"#initialize"

  describe "#draw_tiles" do

    it "returns a collection of random tiles as an Array" do
      @tile_bag.draw_tiles(4).must_be_kind_of Array
    end

    it "returns the correct number of tiles drawn in the array" do
      @tile_bag.draw_tiles(4).length.must_equal 4
    end

    it "raises an error if requested number of tiles is not a number" do
      proc { @tile_bag.draw_tiles("") }.must_raise ArgumentError
    end

  end#of_"#draw_tiles"

  describe "#tiles_remaining" do

    it "reduce the number of tiles in the bag by the number drawn" do
      @tile_bag.draw_tiles(7)
      @tile_bag.tiles_remaining.must_equal 91
    end

  end#of_"#tiles_remaining"

end#of_TileBag
