require_relative 'spec_helper'

describe "tilebag" do
  before do
    @tile_bag = Scrabble::TileBag.new
  end

  it "should create and instance of TileBag" do
    @tile_bag.must_be_kind_of Scrabble::TileBag
  end

  it "Default tiles initialized" do
    @tile_bag.original_tile_bag.must_be_kind_of Hash
  end

  it "Initial tile bag contains 98 tiles " do

  end

end
