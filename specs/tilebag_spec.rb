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
      test_drawn_tiles = @tilebag.draw_tiles(3)
      test_drawn_tiles[0].must_be_kind_of String
    end

    it "Removes tiles from the original set" do
      @tilebag.draw_tiles(3)
      @tilebag.tiles.values.inject(:+).must_be :==,95
    end

  end

  describe "tiles_remaining and draw_tiles edge cases" do

    it "The tiles_remaining variable returns the correct number" do
      @tilebag.draw_tiles(3)
      @tilebag.tiles_remaining.must_equal 95
    end

    it "Raises error if user requests more than 7 tiles" do
      proc {@tilebag.draw_tiles(8)}.must_raise ArgumentError
    end

    it "Raises error if user requests more tiles than are in the bag" do
      @tilebag = Scrabble::TileBag.new
      14.times do
        @tilebag.draw_tiles(7)
      end
      proc {@tilebag.draw_tiles(2)}.must_raise ArgumentError
    end

  end


end
