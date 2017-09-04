require_relative 'spec_helper'


describe "TileBagClass" do
  before do
    @tilebag = Scrabble::TileBag.new
  end

  it "initiates an instance of TileBag" do
    @tilebag.must_be_instance_of Scrabble::TileBag
  end

  it "contains 26 tiles" do
    @tilebag.tiles.must_be_instance_of Array
    @tilebag.tiles.count.must_equal 98
  end

  it "has tiles that each have a letter value" do
    tiles = @tilebag.tiles
    tiles[4].must_be_instance_of String
    tiles[96].must_be_instance_of String
  end
end

describe "draw tiles method" do
  before do
    @tilebag = Scrabble::TileBag.new
  end
  it "returns a collection of tiles as an array" do
    # tilebag = Scrabble::TileBag.new
    @tilebag.draw_tiles(5)
    @tilebag.tiles.must_be_instance_of Array
  end

  it "returns a number of tiles that match the argument given" do
    # tilebag = Scrabble::TileBag.new
    @tilebag.draw_tiles(5).count.must_equal 5
    @tilebag.draw_tiles(7).count.must_equal 7
    @tilebag.draw_tiles(1).count.must_equal 1
  end

  it "returns an argument error if given 0, more than 7, or a non-integer argument" do
    # tilebag = Scrabble::TileBag.new
    proc {@tilebag.draw_tiles(0)}.must_raise ArgumentError
    proc {@tilebag.draw_tiles(9)}.must_raise ArgumentError
    proc {@tilebag.draw_tiles('cats4life') }.must_raise ArgumentError
  end

  it "removes the chosen tiles from the default set" do
    # tilebag = Scrabble::TileBag.new
    @tilebag.draw_tiles(4)
    @tilebag.tiles.count.must_equal 94
    @tilebag.draw_tiles(6)
    @tilebag.tiles.count.must_equal 88
  end

  it "returns the number of tiles remaining in the bag" do
    # tilebag = Scrabble::TileBag.new
    @tilebag.tiles_remaining.must_equal 98
    @tilebag.draw_tiles(4)
    @tilebag.tiles_remaining.must_equal 94
  end
end
