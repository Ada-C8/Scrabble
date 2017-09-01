

require_relative 'spec_helper'


describe "tilebag" do
  before do
    @tile_bag = Scrabble::TileBag.new
  end

  it "should create and instance of TileBag" do
    @tile_bag.must_be_kind_of Scrabble::TileBag
  end

  it "Default tiles initialized" do
    @tile_bag.original_tile_bag.must_be_kind_of Array
  end

  it "Initial tile bag contains 26 kinds of tiles " do
    @tile_bag.original_tile_bag.uniq.count.must_equal 26
  end

  it "Initial tile bag contains 98 total tiles." do
    @tile_bag.original_tile_bag.length.must_equal 98
  end
end

describe "draw_tiles" do

  it "returns an array of tiles" do
    tile_bag = Scrabble::TileBag.new
    tile_bag.draw_tiles(2).must_be_kind_of Array
  end

  it "the elements of the return array are objects from the TileBag" do
    tile_bag = Scrabble::TileBag.new
    originals = tile_bag.original_tile_bag.clone

    tiles = tile_bag.draw_tiles(3)
    tiles.each do |tile|
      originals.include?(tile).must_equal true
    end
  end

  it "after removing the last letter, bag is empty" do
    tile_bag = Scrabble::TileBag.new
    tile_bag.draw_tiles(98)
    tile_bag.original_tile_bag.length.must_equal 0
  end

  it "returns the number of tiles drawn" do
    tile_bag = Scrabble::TileBag.new
    tile_bag.draw_tiles(4).length.must_equal 4
  end

  it "when called 4 times, removes 4 drawn tiles from the original set" do
    tile_bag = Scrabble::TileBag.new
    before = tile_bag.original_tile_bag.length
    tile_bag.draw_tiles(4)
    after = tile_bag.original_tile_bag.length

    (before - 4).must_equal after
  end

  it "cannot draw if no tiles remaining" do
    tile_bag = Scrabble::TileBag.new
    proc{tile_bag.draw_tiles(150)}.must_raise ArgumentError
  end

  it "cannot draw a letter if none remaining" do
      tile_bag = Scrabble::TileBag.new
      originals = tile_bag.original_tile_bag.clone
      tiles_returned = []
      tiles_returned << tile_bag.draw_tiles(98)
      tiles_returned.flatten.sort.must_equal originals
  end
end

describe "tiles remaining" do
  it "number of times remaining must be an integer" do
    tile_bag = Scrabble::TileBag.new
    tile_bag.draw_tiles(15)
    tile_bag.tiles_remaining.must_be_kind_of Integer
  end

  it "returns the correct number of tiles" do
    tile_bag = Scrabble::TileBag.new
    tile_bag.draw_tiles(50)
    tile_bag.tiles_remaining.must_equal 48
  end
end
