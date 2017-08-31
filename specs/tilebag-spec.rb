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

  describe "tiles_remaining" do
    it "returns an updates total of 98 tiles" do
      til = Scrabble::TileBag.new
      til.tiles_remaining.must_equal 98
    end
  end

end
