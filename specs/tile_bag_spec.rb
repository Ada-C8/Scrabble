require_relative 'spec_helper'

describe "TileBag class" do

  describe "initialize" do

    it "creates a new TileBag with a hash of letters and their quantities" do
      new_tile_bag = Scrabble::TileBag.new
      new_tile_bag.must_be_instance_of TileBag
      new_tile_bag.tiles.must_equal Scrabble::TileBag::LETTER_FREQUENCY
    end
  end

end
