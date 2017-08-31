require_relative 'spec_helper.rb'

describe "The TileBag class" do

  before do
    @tilebag = Scrabble::TileBag.new
  end

  describe "Initializing TileBag" do

    it "Tilebag must be instance of Scrabble::TileBag" do
      @tilebag.must_be_instance_of Scrabble::TileBag
    end

    it "Tilebag is a class of the Scrabble" do
      @tilebag.class.must_be_kind_of Class
    end

  end

  describe "The draw_tiles method" do

    it "Responds to the draw_tiles method" do
      @tilebag.must_respond_to :draw_tiles
    end

    it "Returns an array" do
      @tilebag.draw_tiles(3).must_be_kind_of Array
    end
    it "Returns the correct number of tiles in the array" do
      @tilebag.draw_tiles(3).length.must_be :==,3
    end
    it "Returns an array of letters" do
      drawn_tiles = @tilebag.draw_tiles(3)
      drawn_tiles[0].must_be_kind_of String
    end
    it "Removes tiles from the original set" do
      # @tilebag.draw_tiles(3)
      # @tilebag.tiles.values.inject(:+).must_be :==,95
    end

  end
  #
  # describe "The tiles_remaining method" do
  #
  #   it "Responds to the tiles_remaining method" do
  #
  #   end
  #
  # end


end
