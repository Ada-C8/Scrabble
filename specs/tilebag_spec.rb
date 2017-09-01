require_relative 'spec_helper'


describe "TileBagClass" do
  it "initiates an instance of TileBag" do
    tilebag = Scrabble::TileBag.new
    tilebag.must_be_instance_of Scrabble::TileBag
  end

  it "contains 26 tiles" do
    tilebag = Scrabble::TileBag.new
    tilebag.tiles.must_be_instance_of Array
    tilebag.tiles.count.must_equal 26
  end

  it "has tiles that each have a letter and point value" do
    tilebag = Scrabble::TileBag.new
    tiles = tilebag.tiles
    tiles[4].key.must_be_instance_of
    tiles[4].value.must_be_instance_of Integer
  end
end

describe "draw tiles method" do
  let tilebag = Scrabble::TileBag.new

  it "returns a collection of tiles as an array" do
    tilebag.draw_tiles(5)
    tilebag.must_be_instance_of Array
  end

  # it "returns a random selection of tiles" do
  #
  # end

  it "returns a number of tiles that match the argument given" do
    tilebag.draw_tiles(5)
    tilebag.count.must_equal 5
    tilebag.draw_tiles(7)
    tilebag.count.must_equal 7
    tilebag.draw_tiles(1)
    tilebag.count.must_equal 1
  end

  it "returns an argument error if given 0, more than 7, or a non-integer argument" do
    proc {tilebag.draw_tiles(0)}.must_raise ArgumentError
    proc { tilebag.draw_tiles(9)}.must_raise ArgumentError
    proc { Scrabble::Scoring.score("ca4ts") }.must_raise ArgumentError
  end

  it "removes the chosen tiles from the default set" do
    chosen_tiles = tilebag.draw_tiles(4)
    tilebag.tiles.includes?(chosen_tiles).must_equal false
  end


end
