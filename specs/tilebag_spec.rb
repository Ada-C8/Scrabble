require_relative 'spec_helper'

describe "TileBag" do
  describe "#initialize" do
    it "Has a letter quantity hash as an attribute" do
      bag = Scrabble::TileBag.new
      bag.letter_quantity.class.must_equal Hash
      bag.letter_quantity.length.must_equal 26
      bag.letter_quantity[:A].must_equal 9
      bag.letter_quantity[:Z].must_equal 1
    end
  end
  describe "#draw_tiles(num)" do
    it "Returns a collection of random tiles" do
      bag = Scrabble::TileBag.new
      bag.draw_tiles(4).class.must_equal Array
    end
    it "Returns the correct number of tiles" do
      bag = Scrabble::TileBag.new
      bag.draw_tiles(4).length.must_equal 4
    end
    it "Raises an ArgumentError if passed 0 or a negative number" do
      bag = Scrabble::TileBag.new
      proc {bag.draw_tiles(-1)}.must_raise ArgumentError
    end
    it "Removes tiles from the default set" do
      bag = Scrabble::TileBag.new
      before = bag.letter_quantity
      bag.draw_tiles(1)
      after = bag.letter_quantity
      after.wont_equal before
    end
    it "Removes the letter-number pair when the number reaches 0" do
      bag = Scrabble::TileBag.new
      before = bag.letter_quantity.length
      bag.draw_tiles(97)
      after = bag.letter_quantity.length
      after.wont_equal before
    end
  end
  describe "#tiles_remaining" do
    it "Returns the number of tiles remaining in the bag" do
      bag = Scrabble::TileBag.new
      bag.tiles_remaining.must_equal 98
    end
  end
end
