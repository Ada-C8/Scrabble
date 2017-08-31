require_relative 'spec_helper'


describe "TileBagClass" do
  it "initiates an instance of TileBag" do
    tilebag = Scrabble::TileBag.new
    tilebag.must_be_instance_of Scrabble::TileBag
  end

  it "contains 26 tiles" do
    tilebag = Scrabble::TileBag.new
    tilebag.tiles.must_be_instance_of Array
    tilebag.tiles.count.must_equal 26
  end


end
