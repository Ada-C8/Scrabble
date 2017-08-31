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
    it "when drawing one tile should return one tile" do
      picked_tiles = @tilebag.draw_tiles(1)
      picked_tiles.length.must_equal 1
    end

    it "will return more than one tile" do
      picked_tiles = @tilebag.draw_tiles(98)
      picked_tiles.length.must_equal 98
    end

    it "should return an arugment error if number input is 0 or less" do
      proc { @tilebag.draw_tiles(0) }.must_raise ArgumentError
    end

    it "should remove each tile from the @tile" do
      puts "**************"
      starting_tiles = @tilebag.tiles.length
      puts starting_tiles
      num = 10
      @tilebag.draw_tiles(num)
      puts num
      @tilebag.tiles.length.must_equal starting_tiles - num
    end
  end
end #Describe
