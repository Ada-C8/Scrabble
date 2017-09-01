require_relative "spec_helper"

describe "TileBag class" do

  describe "initialize" do
    it "creates an instance" do
      Scrabble::TileBag.new.must_be_kind_of Scrabble::TileBag
    end
    it "returns a total of 98 tiles" do
      til = Scrabble::TileBag.new
      til.tiles.values.inject(:+).must_equal 98
    end
  end

  describe "draw_tiles method" do
    it "returns an array of letters" do
      til = Scrabble::TileBag.new
      til.draw_tiles(4).must_be_instance_of Array
    end
  end

  describe "tiles_remaining" do
    it "returns an updates total of 98 tiles" do
      til = Scrabble::TileBag.new
      til.tiles_remaining.must_equal 98
    end
    it "return 93 tiles when 5 drawn" do
      til = Scrabble::TileBag.new
      til.draw_tiles(5)
      til.tiles_remaining.must_equal 93
    end
  end

end
