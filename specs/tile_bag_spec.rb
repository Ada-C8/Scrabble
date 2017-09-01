require_relative 'spec_helper'

describe "Tilebag" do

  before do
    @tilebag = Scrabble::Tilebag.new
  end

  describe "#initialize" do

    it "should have 98 tiles in @tilebag" do
      @tilebag.tiles.length.must_equal 98
      @tilebag.tiles.must_be_kind_of Array
      @tilebag.must_respond_to :tiles
    end

  end

  describe "#draw_tiles" do

    it "should return an array of picked _tiles" do
      @tilebag.draw_tiles(7).must_be_kind_of Array
    end

    it "when drawing one tile should return one tile" do
      picked_tiles = @tilebag.draw_tiles(1)
      picked_tiles.length.must_equal 1
    end

    it "will return more than one tile" do
      picked_tiles = @tilebag.draw_tiles(98)
      picked_tiles.length.must_equal 98
    end

    it "should remove each tile from the @tile" do
      starting_tiles = @tilebag.tiles.length
      num = 10
      @tilebag.draw_tiles(num)
      @tilebag.tiles.length.must_equal starting_tiles - num
    end

  end #describe "#draw_tiles" do

  describe "#tiles_remaining" do

    it "will return an Integer" do
      @tilebag.tiles_remaining.must_be_kind_of Integer
    end #it "will return an Integer" do

    it "must return the length of @tiles, aka number of tiles remaining" do
      @tilebag.tiles_remaining.must_equal 98
      num = 10
      @tilebag.draw_tiles(num)
      @tilebag.tiles_remaining.must_equal 88
    end #it "must return the length of @tiles

  end #describe "#tiles_remaining" do
end #Describe
