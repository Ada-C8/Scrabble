require_relative 'spec_helper'

describe "Tilebag" do

  before do

    @test_ob = Scrabble::Tilebag.new

    default_tiles = {
      A: 9,
      B: 2,
      C: 2,
      D: 4,
      E: 12,
      F: 2,
      G: 3,
      H: 2,
      I: 9,
      J: 1,
      K: 1,
      L: 4,
      M: 2,
      N: 6,
      O: 8,
      P: 2,
      Q: 1,
      R: 6,
      S: 4,
      T: 6,
      U: 4,
      V: 2,
      W: 1,
      X: 1,
      Y: 2,
      Z: 1
    }

    @total_num_tiles = 0

    default_tiles.each_value do |value|
      @total_num_tiles += value
    end
  end

  describe "initialize method" do

    it "Can be initialized" do
      @test_ob.must_be_instance_of Scrabble::Tilebag
    end

    it "Should initialize as an array of default tiles" do
      @test_ob.default_tiles.must_be_instance_of Array
    end

    it "Should have all the tiles" do
      @test_ob.default_tiles.length.must_equal @total_num_tiles
    end

  end#initialize

  describe "draw_tiles(num) method" do

    it "Can be called" do
      test_ob = Scrabble::Tilebag.new
      test_ob.must_respond_to :draw_tiles
    end

    it "Returns an array " do
      test_ob = Scrabble::Tilebag.new
      test_ob.draw_tiles(3).must_be_instance_of Array
    end

    it "Returns the inputed argument number of tiles " do
      @test_ob.draw_tiles(3).length.must_equal 3
    end

    it "Removes the inputed argument number of tiles from @default_tiles" do
      @test_ob.draw_tiles(10)
      @test_ob.tiles_remaining.must_equal (@total_num_tiles - 10)
    end

  end

end
