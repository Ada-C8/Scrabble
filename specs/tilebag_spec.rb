require_relative 'spec_helper'

describe "TileBag" do
  before do
    @tilebag = Scrabble::TileBag.new
  end
  describe "Initialize" do
    it "Creates an instance of the TileBag class" do
      @tilebag.must_be_instance_of Scrabble::TileBag
    end

    it "Sets up an instance with a collection of all default tiles" do
      @tilebag.tiles.must_be_instance_of Hash
      # Save keys in downcase because words are saved as downcase
      @tilebag.tiles[(65 + rand(26)).chr.downcase].must_be_instance_of Integer # returns the value (number of tiles)
      @tilebag.tiles.values.inject(0, :+).must_equal 98
      @tilebag.tiles.keys[rand(26)].must_be_instance_of String # returns the key (letter)
    end
  end

  describe "draw_tiles(num)" do
    # Test code goes here
    it "Has a method draw_tiles that returns an array of random letters that are Strings" do
      @tilebag.must_respond_to :draw_tiles
      from_draw_tiles = @tilebag.draw_tiles(7)
      from_draw_tiles.must_be_instance_of Array
      from_draw_tiles.length.must_equal 7
      froim_draw_tiles[rand(7)].must_be_instance_of String
    end

    it "Must decrease the tile count of each tile picked from the tile bag" do
      @tilebag.draw_tiles(7)
      @tilebag.tiles.values.inject(0, :+).must_equal 91
    end

  end

  describe "tiles_remaining" do

  end

end
